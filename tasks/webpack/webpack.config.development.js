/* eslint strict: 0 */
'use strict';

var webpack = require('webpack');
var baseConfig = require('./webpack.config.base');

const config = Object.create(baseConfig);

config.debug = true;

config.devtool = 'source-map';

config.entry = [
  './app/index'
];

config.module.loaders.push({
  test: /^((?!\.module).)*\.css$/,
  loaders: [
    'style-loader',
    'css-loader'
  ]
}, {
  test: /\.module\.css$/,
  loaders: [
    'style-loader',
    'css-loader?modules&importLoaders=1&localIdentName=[name]__[local]___[hash:base64:5]!'
  ]
});


// config.plugins.push(
//   new webpack.DefinePlugin({
//     '__DEV__': true,
//     'process.env': {
//       'NODE_ENV': JSON.stringify('development')
//     }
//   })
// );

module.exports = config;
