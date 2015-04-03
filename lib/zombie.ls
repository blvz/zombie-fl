require! {
  yauzl
  xml2js: { parse-string }
  './dom/Flash'
  './dom/Document'
}

module.exports = ->
  fl = new Flash
  { fl } <<<
    open: (file, callback) ->
      err, zip <- yauzl.open file
      return callback? that if err

      entry <- zip.on \entry
      return unless entry.file-name is 'DOMDocument.xml'

      err, stream <- zip.open-read-stream entry
      return callback? that if err

      xml  = ''
      opts = explicit-children: on

      stream.on \data -> xml += it
      stream.on \end -> parse-string xml, opts, (err, {DOMDocument}) ->
        fl.documents ++= new Document file, DOMDocument
        callback? null fl.open-document file
