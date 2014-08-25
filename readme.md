# Couple
> A library for coupling two objects together. This is useful for nested pattern matching.

[![Build Status](https://travis-ci.org/ryansmith94/couple.svg)](https://travis-ci.org/ryansmith94/couple)

## Users
You will soon be able to install this via NPM using `npm install couple --save` and then `couple = require('couple')`. There may also be support for Browsers in the near future.

Documentation can be found in the `[docs](/docs)` directory.

## Developers
You may contribute to this project via issues and pull requests, however, please see the `[contributing.md](/contributing.md)` file before doing so.

### Getting Started
1. Fork the repository.
2. Change the code.
3. Create a pull request (ensuring that you follow the guidelines).

### Directory Structure
This library has been built using primarily CoffeeScript and all of the source is contained within the `[src](/src)` directory, and all of the testing for the library is contained within the `[specs](/specs)` directory.

### Build Process
Gulp is being used to run the build process (`[gulpfile.coffee](/gulpfile.coffee)`). There are three tasks:

1. lint: uses coffee-lint to lint the code ensuring consistency
2. test: uses Jasmine to test the code using the "specs" in the `[specs](/specs)` directory
3. default: which runs `lint` and `test` together

These tasks can be ran by using `gulp ` followed by the task name (i.e. `gulp test`). You should try to ensure that the `default` task runs without any errors before submitting a pull request.
