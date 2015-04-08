require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

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
