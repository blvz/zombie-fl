require! {
  '../lib/zombie'
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
    equal '[object Shape]' ls.3.0.to-string!
    equal '[object Shape]' ls.4.0.to-string!
    equal '[object Shape]' ls.5.0.to-string!
    equal '[object Shape]' ls.6.0.to-string!
    equal '[object Shape]' ls.7.0.to-string!

  test '#isDrawingObject()' ->
    equal false ls.3.0.is-drawing-object!
    equal true  ls.4.0.is-drawing-object!

  test '#isGroup()' ->
    equal false ls.4.0.is-group!
    equal true  ls.5.0.is-group!

  test '#members' ->
    equal void ls.4.0.members
    equal '[object Shape]'          ls.5.0.members.0.to-string!
    equal '[object BitmapInstance]' ls.5.0.members.1.to-string!
    equal '[object SymbolInstance]' ls.5.0.members.2.to-string!

  test '#isRectangleObject()' ->
    equal false ls.5.0.is-rectangle-object!
    equal true  ls.6.0.is-rectangle-object!

  test '#isOvalObject()' ->
    equal false ls.6.0.is-oval-object!
    equal true  ls.7.0.is-oval-object!

suite 'SymbolInstance' ->
  z   = zombie!
  doc = null
  ls  = null

  before (done) ->
    z.open 'test/fixtures/sample-element.fla' ->
      doc := z.fl.get-document-DOM!
      ls  := doc.get-timeline!layers.map (.frames.0.elements)
      done ...

  test '#toString()' ->
    equal '[object SymbolInstance]' ls.1.0.to-string!


suite 'BitmapInstance' ->
  z   = zombie!
  doc = null
  ls  = null

  before (done) ->
    z.open 'test/fixtures/sample-element.fla' ->
      doc := z.fl.get-document-DOM!
      ls  := doc.get-timeline!layers.map (.frames.0.elements)
      done ...

  test '#toString()' ->
    equal '[object BitmapInstance]' ls.2.0.to-string!
