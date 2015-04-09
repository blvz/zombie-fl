require! {
  '..': zombie
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

  test '#toString()' ->
    equal '[object Layer]' ls.0.to-string!

  test '#animationType' ->
    equal 'motion object' ls.0.animation-type
    equal 'none'          ls.3.animation-type

  test '#color' ->
    equal '#FF800A' ls.0.color
    equal '#9933CC' ls.2.color

    ls.0.color = '#FFFFFF'
    equal '#FFFFFF' ls.0.color

    ls.0.color = 0xff0000
    equal '#FF0000' ls.0.color

    ls.0.color = 255
    equal '#0000FF' ls.0.color

  test '#frameCount' ->
    equal 1 ls.0.frame-count

  test '#frames' ->
    equal 1 ls.0.frames.length
    equal 0 ls[*-1].frames.length

  test '#height' ->
    equal 100 ls.0.height
    equal 200 ls.5.height
    equal 300 ls.10.height

    ls.1.height = 200
    ls.2.height = 300
    equal 200 ls.1.height
    equal 300 ls.2.height

  test '#layerType' ->
    equal \normal ls.0.layer-type
    equal \folder ls.1.layer-type
    equal \normal ls.2.layer-type
    equal \guide  ls.4.layer-type
    equal \guide  ls.6.layer-type
    equal \guided ls.7.layer-type
    equal \mask   ls.8.layer-type
    equal \masked ls.9.layer-type

  test '#locked' ->
    equal false ls.7.locked
    equal true  ls.8.locked
    equal true  ls.9.locked

  test '#name' ->
    equal 'Layer 3'  ls.0.name
    equal 'Folder 1' ls.1.name

  test '#outline' ->
    equal true  ls.6.outline
    equal false ls.7.outline

  test '#parentLayer' ->
    equal ls.2.parent-layer.name, ls.1.name

  test '#visible' ->
    equal true  ls.2.visible
    equal false ls.3.visible
