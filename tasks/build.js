'use strict';

var gulp = require('gulp');
var babel = require('gulp-babel');
var riot = require('gulp-riot');
var sourcemaps = require('gulp-sourcemaps');
var jetpack = require('fs-jetpack');
var webpack = require('webpack');

var utils = require('./utils');

var projectDir = jetpack;
var srcDir = projectDir.cwd('./app');
var destDir = projectDir.cwd('./build');

var config = require('./webpack/webpack.config.development');

var compiler = webpack(config);
var paths = {
    copyFromAppDir: [
        './**/*.html'
    ]
}

// -------------------------------------
// Tasks
// -------------------------------------

gulp.task('clean', function(callback) {
    return destDir.dirAsync('.', { empty: true });
});


var copyTask = function () {
    projectDir.copy('resources/icon.png', destDir.path('icon.png'), { overwrite: true });
    projectDir.copy('resources/icon.tiff', destDir.path('icon.tiff'), { overwrite: true });

    return projectDir.copyAsync('app', destDir.path(), {
        overwrite: true,
        matching: paths.copyFromAppDir
    });
};
gulp.task('copy', ['clean'], copyTask);
gulp.task('copy-watch', copyTask);


var buildTask = function (cb) {
  var started = false;

  function bundle(err, stats) {
    if (err) {
      console.error(err);
    }

    console.log('[webpack]', stats.toString({colors: true}));

    if (!started) {
      started = true;
      return cb();
    }
  }

  compiler.run(bundle);
};

gulp.task('buildCode', ['clean'], buildTask);
gulp.task('buildCodeWatch', buildTask);


// Add and customize OS-specyfic and target-specyfic stuff.
gulp.task('finalize', ['clean'], function () {
    var manifest = srcDir.read('package.json', 'json');
    switch (utils.getEnvName()) {
        case 'production':
            // Hide dev toolbar if doing a release.
            manifest.window.toolbar = false;
            break;
        case 'test':
            // Add "-test" suffix to name, so NW.js will write all
            // data like cookies and locaStorage into separate place.
            manifest.name += '-test';
            // Change the main entry to spec runner.
            manifest.main = 'spec.html';
            break;
        case 'development':
            // Add "-dev" suffix to name, so NW.js will write all
            // data like cookies and locaStorage into separate place.
            manifest.name += '-dev';
            break;
    }
    destDir.write('package.json', manifest);

    var configFilePath = projectDir.path('config/env_' + utils.getEnvName() + '.json');
    destDir.copy(configFilePath, 'env_config.json');
});


gulp.task('watch', function () {
  gulp.watch(['app/**/*'], ['buildCodeWatch']);
  gulp.watch(paths.copyFromAppDir, { cwd: 'app' }, ['copy-watch']);
});


gulp.task('build', ['buildCode', 'copy', 'finalize']);
