require! {
  fs
  'prelude-ls': { at, map, filter, find-index }
  './Base'
}

module.exports = class Flash extends Base
  current-doc = -1

  documents: []
  version: 'FAKE 0,0,1,0'
  trace: -> console.log it
  get-document-DOM: -> @documents |> at current-doc
  file-exists: -> fs.exists-sync pathfy it
  open-document: (uri) ->
    path = pathfy uri
    index = @documents |> find-index (.path is path)
    if index?
      current-doc := index
      @documents |> at current-doc
    else null

  find-document-index: (name) ->
    @documents
    |> filter (.name is name)
    |> map ~> @documents.index-of it

function pathfy => it - /^file:\/\/\//
