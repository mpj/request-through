constructor = require './constructor'
request = require 'request'
module.exports = constructor.bind(null, request)
