bourbon  = require 'node-bourbon'
gulp     = require('gulp')
gulputil = require('gulp-util')
sass     = require('gulp-sass')
prefix   = require('gulp-autoprefixer')
csso     = require('gulp-csso')
csscomb  = require('gulp-csscomb')
rename   = require('gulp-rename')

gulp.task 'compile', ->
  gulp.src('./src/main.sass')
    .pipe sass(
      style: 'expanded'
      precision: 10
      sourceComments: 'normal'
      includePaths: bourbon.includePaths
      errLogToConsole: true
    )
    .pipe prefix(
      cascade: true
      "last 2 versions"
    )
    .pipe csscomb()
    .pipe rename('utilCls.css')
    .pipe gulp.dest('./dst')
    .pipe csso()
    .pipe rename('utilCls.min.css')
    .pipe gulp.dest('./dst')

gulp.task 'default', ['compile']
