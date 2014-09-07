# Dependencies.
gulp = require('gulp')

# Testing.
jasmine = require('gulp-jasmine')
gulp.task('test', ['compileTests'], () ->
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
gulp.task('compileTests', () ->
    gulp.src('coffee/spec/**/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('js/spec'))
)
gulp.task('compileSource', ['test'], () ->
    gulp.src('coffee/src/**/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('js/src'))
)

gulp.task('default', ['lint', 'compileSource'])
