require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Timeline' ->
  z  = zombie!
  t  = null
  ts = null

  before (done) ->
    z.open 'test/fixtures/sample-timeline.fla' ->
      t  := z.fl.get-document-DOM!get-timeline!
      ts := z.fl.get-document-DOM!timelines
      done ...

  test '#toString()' ->
    equal '[object Timeline]' t.to-string!

  test '#name' ->
    equal 'Scene 1' t.name
    equal 'Scene 2' ts.1.name

  test '#layers' ->
    equal 3 t.layers.length
    equal 2 ts.1.layers.length
