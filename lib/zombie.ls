require! {
  yauzl
  xml2js: { parse-string }
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
        }
        fl.open-document file

        callback? null
