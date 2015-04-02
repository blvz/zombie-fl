require! {
  'prelude-ls': { at }
}

module.exports = ->
  current-doc = -1

  documents: []
  version: 'FAKE 0,0,1,0'
  trace: -> console.log it
  get-document-DOM: -> @documents.concat! |> at current-doc
