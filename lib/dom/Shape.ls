require! <[ ./Base ./Element ]>

module.exports = class Shape extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

    drawing = (xml.attr \isDrawingObject) is \true
    group   = xml.name is \DOMGroup
    rect    = xml.name is \DOMRectangleObject
    oval    = xml.name is \DOMOvalObject

    if group
      ms = xml.$ 'members/*' .children
      @members = ms.map Element.mapper

    @is-drawing-object   = -> drawing
    @is-group            = -> group
    @is-rectangle-object = -> rect
    @is-oval-object      = -> oval
