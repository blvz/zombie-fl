require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Element' ->
  z   = zombie!
  doc = null
  ls  = null

  before (done) ->
    z.open 'test/fixtures/sample-element.fla' ->
      doc := z.fl.get-document-DOM!
      ls  := doc.get-timeline!layers.map (.frames.0.elements)
      done ...

  test '#toString()' ->
    equal '[object Element]' ls.0.0.to-string!
