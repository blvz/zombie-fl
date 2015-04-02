require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Layer' ->
  z   = zombie!
  doc = null
  ls  = null

  before (done) ->
    z.open 'test/fixtures/sample-layer.fla' ->
      doc := z.fl.get-document-DOM!
      ls  := doc.get-timeline!layers
      done ...

  test '#animationType' ->
    equal 'motion object' ls.0.animation-type
    equal 'none'          ls.3.animation-type

  test '#color'
  test '#frameCount'
  test '#frames'
  test '#height'
  test '#layerType'
  test '#locked'
  test '#name'
  test '#outline'
  test '#parentLayer'
  test '#visible'
