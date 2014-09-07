(function() {
  var requirejs;

  requirejs = require('requirejs');

  requirejs.config({
    nodeRequire: require
  });

  requirejs(['./couple', './typedCouple', './match', './merge', './type', './validate'], function() {});

}).call(this);
