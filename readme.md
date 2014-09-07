# Couple
> A library for coupling two objects together. This is useful for nested pattern matching.

[![Build Status](https://travis-ci.org/ryansmith94/couple.svg)](https://travis-ci.org/ryansmith94/couple)

## Users
You will soon be able to install this via NPM using `npm install couple --save` and then `couple = require('couple')`. You can also use this in the browser, just download the source and use requirejs to require `couple/js/src/export`. Support should be added for Bower and NPM soon (feel free to submit a pull request).

Documentation can be found in the [docs](/docs) directory.

## Developers
You may contribute to this project via issues and pull requests, however, please see the [contributing.md](/contributing.md) file before doing so.

### Getting Started
1. Fork the repository.
2. Clone your forked version of the repository.
3. Change the code.
4. Run `npm install`.
5. Run `gulp`.
6. Commit and push your changes to Github.
7. Create a pull request on Github (ensuring that you follow the guidelines).

### Directory Structure
This library has been built using primarily CoffeeScript and all of the source is contained within the [coffee/src](/coffee/src) directory, and all of the testing for the library is contained within the [coffee/specs](/coffee/specs) directory.

### Build Process
Gulp is being used to run the build process ([gulpfile.coffee](/gulpfile.coffee)). You should try to ensure that the `default` task runs without any errors before submitting a pull request by running `gulp`.
