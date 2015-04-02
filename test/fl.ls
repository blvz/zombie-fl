require! {
  '../lib/zombie'
  path
  chai: { assert: { equal } }
  'prelude-ls': { last, first, drop }
}

suite 'fl' ->
  z  = null
  fl = null

  before-each (done) ->
    z := zombie!
    z.open 'test/fixtures/sample1-copy.fla' ->
      z.open 'test/fixtures/sample1.fla' ->
        fl := z.fl
        done!

  test '#version' ->
    equal \FAKE (first <| drop 1 <| fl.version is /([A-Z]+)\s\d+,\d+,\d+,\d+/)

  test '#documents' ->
    equal 2 fl.documents.length

  test '#getDocumentDOM()' ->
    equal do
      fl.documents |> last |> (.path)
      fl.get-document-DOM!path

  test '#fileExists(uri)' ->
    p = path.resolve path.join 'test', 'fixtures', 'sample1.fla'
    .replace /([a-z]):/i '$1|'
    .replace /\\/g '/' # '
    equal true fl.file-exists "file:///#p"

  test '#findDocumentIndex(name)' ->
    equal 1 (first <| fl.find-document-index 'sample1.fla')
    equal 0 (fl.find-document-index \null).length

  test '#openDocument(uri)' ->
    xs = <[ test/fixtures/sample1.fla test/fixtures/sample1-copy.fla ]>
    for x in xs
      doc = fl.open-document x
      equal x, doc.path

    equal null fl.open-document \null
    equal (last <| xs), fl.get-document-DOM!path

  # TODO: implement these
  test '#closeAll(prompt=true)'
  test '#closeDocument(doc, prompt=true)'
  test '#configDirectory'
  test '#configURI'
  test '#externalLibraryPath'
  test '#findDocumentDOM(id)'
  test '#findObjectInDocByName(instanceName, doc)'
  test '#findObjectInDocByType(type, doc)'
  test '#findObjectInDocByType(type, doc)'
  test '#libraryPath'
  test '#packagePaths'
  test '#as3PackagePaths'
  test '#resetPackagePaths()'
  test '#resetAS3PackagePaths()'
  test '#addEventListener(event, callback)'
  test '#removeEventListener(event, callbackId)'
  test '#selectElement(element, editMode)'
  test '#sourcePath'
