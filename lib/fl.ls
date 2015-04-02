require! {
  fs
  'prelude-ls': { at, map, take-while }
}

module.exports = ->
  current-doc = -1

  documents: []
  version: 'FAKE 0,0,1,0'
  trace: -> console.log it
  get-document-DOM: -> @documents.concat! |> at current-doc
  file-exists: -> fs.exists-sync it - /^file:\/\/\//
  find-document-index: (name) ->
    @documents
    |> take-while (.name is name)
    |> map ~> @documents.index-of it
