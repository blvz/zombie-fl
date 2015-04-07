require! {
  '../lib/zombie'
  chai: { assert: { equal } }
}

suite 'Frame' ->
  z   = zombie!
  doc = null
  fs  = null

  before (done) ->
    z.open 'test/fixtures/sample-frame.fla' ->
      doc := z.fl.get-document-DOM!
      fs  := doc.get-timeline!layers.0.frames
      done ...

  test '#toString()' ->
    equal '[object Frame]' fs.0.to-string!

  test '#actionScript' ->
    equal 'stop();' fs.0.action-script
    equal '' fs.3.action-script

  test '#duration' ->
    equal 3 fs.0.duration
    equal 7 fs.3.duration
    equal 5 fs.10.duration

  test '#isEmpty()' ->
    equal true  fs.0.is-empty!
    equal false fs.15.is-empty!

  test '#labelType' ->
    equal \name    fs.3.label-type
    equal \comment fs.10.label-type
    equal \anchor  fs.15.label-type

  test '#name' ->
    equal \label   fs.3.name
    equal \c0mment fs.10.name
    equal \anch0r  fs.15.name

  test '#startFrame' ->
    equal 0 fs.0.start-frame
    equal 0 fs.1.start-frame
    equal 0 fs.2.start-frame
    equal 3 fs.3.start-frame
    equal 3 fs.5.start-frame
    equal 3 fs.9.start-frame
    equal 10 fs.11.start-frame
    equal 15 fs.16.start-frame

  test.skip '#elements' ->
    equal 3 fs.15.elements.length
