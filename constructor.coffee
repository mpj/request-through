_ = require 'highland'
duplexify = require 'duplexify'
module.exports = (request) ->
  writeable = _()
  readable = _()
  through = _().consume (outerError, opts, push, next) ->
    request opts, (innerError, response, body) ->
      push(innerError, {response, body})
      next()
  writeable.through(through).pipe(readable)
  duplexify writeable, readable, objectMode: true
