let mix = require('laravel-mix'); 
mix.disableNotifications();
let path = require('path');
const FaviconsWebpackPlugin = require('favicons-webpack-plugin');

// Javascript to process
mix.js('resources/js/app.js', 'assets/js').version()
   
// Styles to process
mix.sass('resources/scss/app.scss', 'assets/css').version()
if (mix.inProduction()) {
    // Copy fonts to the public directory only in production
    mix.copyDirectory('resources/fonts', 'website/public_html/assets/fonts');
}
// Pathing and HMR
mix.setPublicPath('website/public_html')
    .options({
        fileLoaderDirs:  {
            fonts: 'assets/fonts'
        },
    });

mix.alias({
    '@abstracts/bootstrap': path.join(__dirname, 'resources/scss/abstracts/bootstrap.scss'),
    '@utilities/bootstrap': path.join(__dirname, 'resources/scss/utilities/bootstrap.scss'),
    '@abstracts/ask': path.join(__dirname, 'resources/scss/abstracts/ask'),
});

// Browsersync
mix.browserSync({
    proxy: process.env.APP_URL,
    files: ["resources/**/*.scss", "resources/**/*.js", "website/system/user/templates/**/*.html"],
    watch: true,
    open: false,
    reloadDebounce: 2000,
});

// Favicon config
mix.webpackConfig({
    target: "web",
    plugins: [
       new FaviconsWebpackPlugin({
          logo: 'resources/images/meta/favicon.svg',
          cache: true,
          outputPath: "./assets/images/meta/",
          lang: "nl-NL",
          prefix: "./assets/images/meta/",
          favicons: {
            appName: process.env.APP_NAME,
            start_url: '/',
            developerName: 'Dunique',
            developerURL: 'https://dunique.nl/',
            icons: {
              android: true,
              appleIcon: true,
              appleStartup: false,
              favicons: true,
              windows: true,
              coast: false,
              yandex: false,
            },
          },
       }),
    ],
 });