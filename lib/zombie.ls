require! {
  yauzl
  xml2js: { parse-string }
  'prelude-ls': { Obj }
  './fl': create-fl
}

module.exports = ->
  fl = create-fl!
  { fl } <<<
    open: (file, callback) ->
      err, zip <- yauzl.open file
      return callback? that if err

      entry <- zip.on \entry
      return unless entry.file-name is 'DOMDocument.xml'

      err, stream <- zip.open-read-stream entry
      return callback? that if err

      xml = ''
      stream.on \data -> xml += it
      stream.on \end -> parse-string xml, (err, {DOMDocument}) ->
        fl.documents ++= {
          name: file - /^.*\//
          path: file
        } <<< parse-document DOMDocument

        callback? null fl.open-document file

function parse-document {$, timelines}
  current-timeline: $.current-timeline |> parse-int |> (- 1)
  timelines: timelines.0.DOMTimeline.map parse-timeline
  get-timeline: -> @timelines[@current-timeline]

function parse-timeline {$, layers}
  layers = layers.0.DOMLayer
  name: $.name
  layers: layers.map parse-layer layers, _

function parse-layer layers, {$, frames}:layer
  clr = $.color
  parent = null

  if $.parent-layer-index
    parent = parse-layer layers, layers[$.parent-layer-index]

  fs = parse-frames-duration (frames?0.DOMFrame or []).map parse-frame

  name: $.name
  locked: $.locked is \true
  outline: $.outline is \true
  visible: not ($.visible is \false)
  animation-type: $.animation-type or \none
  height: ($.height-multiplier or 1) * 100
  color:~
    \   -> clr.to-upper-case!
    (c) ->
      clr := switch typeof c
             | \string => c
             | \number => \# + ('00000' + (c .|. 0).to-string 16).substr -6

  layer-type: switch parent?layer-type
              | \mask     => \masked
              | \guide    => \guided
              | otherwise => $.layer-type or \normal

  frame-count: fs.length
  parent-layer: parent
  frames: fs

function parse-frame {$, Actionscript, elements}
  action-script: Actionscript?0.script.0 or ''
  name: $.name or ''
  label-type: $.label-type or ''
  duration: (parse-int $.duration) or 1
  start-frame: parse-int $.index
  is-empty: -> Obj.empty elements.0
  elements: elements

function parse-frames-duration frames
  fs = []
  for f in frames
    for d in [0 til f.duration]
      fs[f.start-frame + d] = f
  fs
