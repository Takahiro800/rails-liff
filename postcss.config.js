module.exports = {
  plugins: [
    // require('tailwindcss')('javascript/stylesheets/tailwind.config.js'),
    require('tailwindcss')('tailwind.config.js'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009',
      },
      stage: 3,
    }),
  ],
};
