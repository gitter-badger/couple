# Dependencies.
gulp = require('gulp')

# Testing.
jasmine = require('gulp-jasmine')
gulp.task('test', () ->
    gulp.src('spec/*.coffee')
        .pipe(jasmine())
)

# Linting.
coffeelint = require('gulp-coffeelint')
gulp.task('lint', () ->
    gulp.src('*.coffee')
        .pipe(coffeelint('coffeelint.json'))
        .pipe(coffeelint.reporter())
)

gulp.task('default', ['lint', 'test'])
