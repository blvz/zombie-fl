require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Document' ->
  z    = zombie!
  doc  = null
  path = 'test/fixtures/sample1.fla'

  before (done) ->
    z.open path, ->
      doc := z.fl.get-document-DOM!
      done ...

  test '#toString()' ->
    equal '[object Document]' doc.to-string!

  test '#path' ->
    equal path, doc.path

  test '#name' ->
    name = 'sample1.fla'
    equal true, (path.index-of name) >= 0
    equal name, doc.name

  test '#timelines' ->
    equal 1 doc.timelines.length

  test '#currentTimeline()' ->
    equal 0 doc.current-timeline

  test '#getTimeline()' ->
    equal 'Scene 1' doc.get-timeline!name
