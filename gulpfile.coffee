gulp     = require('gulp')
gulputil = require('gulp-util')
clean    = require('gulp-clean')
sass     = require('gulp-sass')
prefix   = require('gulp-autoprefixer')
cssmin   = require('gulp-cssmin')
rename   = require('gulp-rename')
compass  = require('gulp-compass')

gulp.task 'compile', ->
  gulp.src('./src/scss/main.sass')
    .pipe sass(includePaths: ['./src/scss'])
    .pipe prefix("> 1%")
    .pipe rename('util-cls.css')
    .pipe gulp.dest('./src/css')
    .pipe cssmin(keepSpecialComments: 0)
    .pipe rename('util-cls.min.css')
    .pipe gulp.dest('./src/css')

gulp.task 'default', ['compile']
