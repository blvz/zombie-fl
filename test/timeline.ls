require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Timeline' ->
  z        = zombie!
  timeline = null

  before (done) ->
    z.open 'test/fixtures/sample1.fla' ->
      timeline := z.fl.get-document-DOM!timelines.0
      done ...

  test '#name' ->
    equal 'Scene 1' timeline.name

  test '#layers' ->
    equal 3 timeline.layers.length
