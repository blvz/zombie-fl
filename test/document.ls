require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Document' ->
  z    = zombie!
  doc  = null
  path = 'test/fixtures/sample1.fla'

  before-each (done) ->
    z.open path, ->
      doc := z.fl.get-document-DOM!
      done ...

  test '#path' ->
    equal path, doc.path
