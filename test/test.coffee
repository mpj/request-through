sinon = require 'sinon'
assert = require 'assert'
_ = require 'highland'

constructor = require '../constructor'

describe 'request-through', ->
  request = null
  subject = null
  beforeEach ->
    request = sinon.stub()
    subject = constructor(request)

  it 'streams result', (done) ->
    dummyRequestOptions = {}
    dummyResponse = {}
    dummyBody = {}

    request.withArgs(dummyRequestOptions)
      .yields null, dummyResponse, dummyBody
    _([dummyRequestOptions])
      .through(subject)
      .each (x) ->
        assert.equal x.body, dummyBody
        assert.equal x.response, dummyResponse
        done()

  it.skip 'streams errors', (done) ->
    # TODO Blocked by https://github.com/caolan/highland/issues/136
