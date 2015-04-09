require! {
  yauzl
  xamel: { parse }
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
      stream.on \data -> xml += it
      stream.on \end -> parse xml, {cdata: yes} (err, xml) ->
        return callback? that if err
        fl.documents ++= new Document file, xml.children.0
        callback? null fl.open-document file
