# Couple
> A library for coupling two objects together. This is useful for nested pattern matching.

[![Build Status](https://travis-ci.org/ryansmith94/couple.svg)](https://travis-ci.org/ryansmith94/couple)

## Users
Documentation can be found in the [docs](/docs) directory. Installation instructions for Node and the Browser can be found below.

### Node
You should use NPM to install this for Node using `npm install npm-couple` and then use requirejs to require `require('npm-couple')`.

### Browser
You should use Bower to install this for the Browser using `bower install couple` and then use requirejs to require `bower_components/couple/build/export`.

## Developers
You may contribute to this project via issues and pull requests, however, please see the [contributing.md](/contributing.md) file before doing so.

### Getting Started
1. Fork the repository.
2. Clone your forked version of the repository.
3. Change the code.
4. Run `npm install`.
5. Run `gulp`.
6. Repeat from Step 3 or continue to step 7.
7. Commit and push your changes to Github.
8. Create a pull request on Github (ensuring that you follow the guidelines).

### Directory Structure
This library has been built using primarily CoffeeScript and all of the source is contained within the [src](src) directory, and all of the testing for the library is contained within the [specs](/specs) directory.

### Build Process
Gulp is being used to run the build process ([gulpfile.coffee](/gulpfile.coffee)). You should try to ensure that the `default` task runs without any errors before submitting a pull request by running `gulp`.
