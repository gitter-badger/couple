# Dependencies.
gulp = require('gulp')

# Testing.
jasmine = require('gulp-jasmine')
gulp.task('test', () ->
    gulp.src('js/spec/**/*.js')
        .pipe(jasmine())
)

# Linting.
coffeelint = require('gulp-coffeelint')
gulp.task('lint', () ->
    gulp.src('coffee/**/*.coffee')
        .pipe(coffeelint('coffeelint.json'))
        .pipe(coffeelint.reporter())
)

# Compiling.
coffee = require('gulp-coffee')
gulp.task('compile', () ->
    gulp.src('coffee/**/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('js'))
)

gulp.task('default', ['lint', 'compile', 'test'])
