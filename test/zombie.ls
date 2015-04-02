require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'zombie' ->
  z = zombie!

  test '#open(file, callback)' (done) ->
    z.open 'test/fixtures/sample1.fla' (err, doc) ->
      done ...
      equal 'sample1.fla' doc.name
