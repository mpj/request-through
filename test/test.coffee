sinon = require 'sinon'
assert = require 'assert'

list = require '../index.coffee'

describe 'given stuff', ->
  clock = null
  beforeEach -> clock = sinon.useFakeTimers()
  afterEach  -> clock.restore()

  it 'should do things', ->
