<?php

namespace AVB\DevelopmentFramework\Commands;

use PDO;
use AVB\DevelopmentFramework\Abstract\CommandAbstract;

class InstallCommand extends CommandAbstract
{
  protected $command = 'install';

  protected $description = 'Installs the specified Expression Engine project';

  public function execute($args): void
  {
    $this->installExpressionEngine($args);
  }

  private function installExpressionEngine($args)
  {
    if ($this->isDatabaseEmpty()) {
      $webRoot = BASEPATH . '/website';
      $systemPath = $webRoot . '/system';
      // Check if ExpressionEngine is already downloaded
      if (!file_exists($systemPath . '/ee/installer/config/config.php')) {
        // ExpressionEngine is not downloaded, execute the download command
        $downloadCommand = new DownloadCommand();
        $downloadCommand->execute([]);
      }

      $url = $_ENV['APP_URL'] . '/cms.php?C=wizard&M=do_install&language=english';

      $userdata = array(
        'database' => 'mysql',
        'db_hostname' => $_ENV['DB_HOST'],
        'db_name' => $_ENV['DB_DATABASE'],
        'db_username' => $_ENV['DB_USERNAME'],
        'db_password' => $_ENV['DB_PASSWORD'],
        'db_prefix' => 'exp',
        'site_label' => $_ENV['APP_NAME'],
        'site_name' => 'default_site',
        'site_url' => $_ENV['APP_URL'],
        'username' => $_ENV['EE_USERNAME'],
        'password' =>  $_ENV['EE_PASSWORD'],
        'password_confirm' => $_ENV['EE_PASSWORD'],
        'screen_name' => $_ENV['EE_SCREENNAME'] ?? $_ENV['EE_USERNAME'],
        'email_address' => $_ENV['EE_EMAIL'],
        'webmaster_email' => $_ENV['WEBMASTER_EMAIL'] ?? $_ENV['EE_EMAIL'],
        'default_site_timezone' => date_default_timezone_get(),
        'license_agreement' => 'y',
      );

      $postData = http_build_query($userdata);

      $options = array(
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => $postData,
        CURLOPT_RETURNTRANSFER => true,
      );
      $this->logger->log("Starting Expression engine installation", 'info');

      $ch = curl_init($url);
      curl_setopt_array($ch, $options);
      $response = curl_exec($ch);

      // Check for cURL errors
      if ($response === false) {
        echo "Error executing cURL request: " . curl_error($ch) . "\n";
        curl_close($ch);
        exit;
      }
      // Get HTTP response code
      $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
      curl_close($ch);
      
      // Handle HTTP response codes
      if ($httpCode === 404) {
        $this->logger->log("Error: ExpressionEngine installation endpoint not found (404).", 'error');
        exit;
      } 

      // Handle successful installation
      $this->logger->log('ExpressionEngine installation completed successfully.', 'success');
      // $themeCommand = new BoilerplateCommand();
      // $themeCommand->execute($arguments);
    } else {

      $this->logger->log('Database not empty.', 'error');
    }
  }
  private function isDatabaseEmpty()
  {
    // Connect to the database
    $dbHost = $_ENV['DB_HOST'];
    $dbName = $_ENV['DB_DATABASE'];
    $dbUsername = $_ENV['DB_USERNAME'];
    $dbPassword = $_ENV['DB_PASSWORD'];

    // Construct the command
    $command = "mysql -h {$dbHost} -u {$dbUsername} -p{$dbPassword} -e 'SET FOREIGN_KEY_CHECKS = 0; SHOW TABLES' {$dbName}  2>/dev/null";

    // Execute the command
    $response = $this->runMysql([$command]);

    // Check for errors
    if ($response['code'] !== 0) {
      $this->logger->log($response['error'], 'error');
      exit;
    }
    // Check if tables are present
    return empty($response['message']);
  }
}
