require! <[ ./Base ./Layer ]>

module.exports = class Timeline extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

    ls      = xml.$ 'layers/*' .children
    @name   = xml.attr \name
    @layers = Layer.map-parents <| ls.map Layer
