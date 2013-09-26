'use strict';

var scaffold = require('../../lib/scaffold');
var collectionView = module.exports = Object.create(scaffold);

collectionView.name = 'collection-view';

collectionView.validate = function(name) {
  if(name === 'base') {
    return false;
  }
  return scaffold.validate.apply(this, arguments);
};