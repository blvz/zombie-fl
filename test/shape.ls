require! {
  '..': zombie
  chai: { assert: { equal } }
}

suite 'Shape' ->
  z   = zombie!
  doc = null
  ls  = null

  before (done) ->
    z.open 'test/fixtures/sample-element.fla' ->
      doc := z.fl.get-document-DOM!
      ls  := doc.get-timeline!layers.map (.frames.0.elements)
      done ...

  test '#toString()' ->
    equal '[object Shape]' ls.4.0.to-string!
    equal '[object Shape]' ls.5.0.to-string!
    equal '[object Shape]' ls.6.0.to-string!
    equal '[object Shape]' ls.7.0.to-string!
    equal '[object Shape]' ls.8.0.to-string!
    equal '[object Shape]' ls.9.0.to-string!

  test '#isDrawingObject()' ->
    equal false ls.5.0.is-drawing-object!
    equal true  ls.6.0.is-drawing-object!

  test '#isGroup()' ->
    equal false ls.6.0.is-group!
    equal true  ls.7.0.is-group!

  test '#members' ->
    equal void ls.6.0.members
    equal '[object Shape]'          ls.7.0.members.0.to-string!
    equal '[object BitmapInstance]' ls.7.0.members.1.to-string!
    equal '[object SymbolInstance]' ls.7.0.members.2.to-string!

  test '#isRectangleObject()' ->
    equal false ls.7.0.is-rectangle-object!
    equal true  ls.8.0.is-rectangle-object!

  test '#isOvalObject()' ->
    equal false ls.8.0.is-oval-object!
    equal true  ls.9.0.is-oval-object!

  test '#contours' ->
    equal void        ls.4.0.contours.0.fill.color
    equal '#FF0066A8' ls.4.0.contours.1.fill.color

suite 'Fill' ->
  z   = zombie!
  doc = null
  ls  = null

  before (done) ->
    z.open 'test/fixtures/sample-element.fla' ->
      doc := z.fl.get-document-DOM!
      ls  := doc.get-timeline!layers.map (.frames.0.elements)
      done ...

  test '#style' ->
    equal \bitmap         ls.3.0.contours.1.fill.style
    equal \solid          ls.4.0.contours.1.fill.style
    equal \linearGradient ls.5.0.contours.1.fill.style
    equal \radialGradient ls.9.0.contours.1.fill.style

  test '#color' ->
    equal \#FF0066A8 ls.4.0.contours.1.fill.color
    equal \#CCFF00   ls.6.0.contours.1.fill.color
    equal \#6600CCA8 ls.8.0.contours.1.fill.color

  test '#colorArray' ->
    [ c1, c2 ] = ls.5.0.contours.1.fill.color-array
    equal \#FF00007A c1
    equal \#FF00FF4D c2

    [ c1, c2, c3 ] = ls.9.0.contours.1.fill.color-array
    equal \#9C00FFBA c1
    equal \#527AD3CF c2
    equal \#00FFA1   c3

  test '#posArray' ->
    [ p1, p2 ] = ls.5.0.contours.1.fill.pos-array
    equal   0 p1
    equal 255 p2

    [ p1, p2, p3 ] = ls.9.0.contours.1.fill.pos-array
    equal   0 p1
    equal 171 p2
    equal 255 p3

  test '#overflow' ->
    equal \repeat  ls.5.0.contours.1.fill.overflow
    equal \reflect ls.9.0.contours.1.fill.overflow

  test '#bitmapPath' ->
    equal 'fldr/zombie-icon.png' ls.3.0.contours.1.fill.bitmap-path
