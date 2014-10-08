_ = require 'highland'

request = require './index'
_([
  uri: 'https://test.stellar.org:9002'
  method: 'POST'
  json: true
  body: JSON.stringify
    "method": "account_info",
    "params": [
      {
        "account": "ganVp9o5emfzpwrG5QVUXqMv8AgLcdvySb",
        "ledger_index": 400
      }
    ]
])
.through(request())
.each (x) -> console.log JSON.stringify x, null, 2
