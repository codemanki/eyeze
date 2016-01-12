var path = require('path');
var webpack = require('webpack');

module.exports = {
  module: {
    preLoaders: [{
      test: /\.tag$/,
      exclude: /node_modules/,
      loader: 'riotjs-loader'
    }],
    loaders: [{
      test: /\.js|\.tag$/,
      loader: 'babel-loader',
      exclude: /node_modules/,
      query: {
        presets: ['es2015'],
      }
    }]
  },
  output: {
    path: path.join(__dirname, '../../', 'build'),
    filename: 'bundle.js'
  },
  target: 'node-webkit',
  resolve: {
    extensions: ['', '.js'],
    packageMains: ['webpack', 'browser', 'web', 'browserify', ['jam', 'main'], 'main']
  },
  plugins: [
   new webpack.ProvidePlugin({
      riot: 'riot',
      $: 'jquery'
    })
  ]
};
