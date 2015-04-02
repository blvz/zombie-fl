require! {
  '../lib/zombie'
  path
  chai: { assert: { equal } }
  'prelude-ls': { first, drop }
}

suite 'fl' ->
  z  = zombie!
  fl = null

  before-each (done) ->
    z.open 'test/fixtures/sample1.fla', ->
      fl := z.fl
      done ...

  test '#version' ->
    equal \FAKE (first <| drop 1 <| fl.version is /([A-Z]+)\s\d+,\d+,\d+,\d+/)

  test '#documents' ->
    equal true Boolean fl.documents?0?

  test '#getDocumentDOM()' ->
    equal fl.documents.0.path, fl.get-document-DOM!path

  test '#fileExists(uri)' ->
    p = path.resolve path.join 'test', 'fixtures', 'sample1.fla'
    .replace /([a-z]):/i '$1|'
    .replace /\\/g '/' # '
    equal true fl.file-exists "file:///#p"

  test '#findDocumentIndex(name)' ->
    equal 0 (first <| fl.find-document-index 'sample1.fla')
    equal 0 (fl.find-document-index \null).length

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
  test '#openDocument'
  test '#packagePaths'
  test '#as3PackagePaths'
  test '#resetPackagePaths()'
  test '#resetAS3PackagePaths()'
  test '#addEventListener(event, callback)'
  test '#removeEventListener(event, callbackId)'
  test '#selectElement(element, editMode)'
  test '#sourcePath'
