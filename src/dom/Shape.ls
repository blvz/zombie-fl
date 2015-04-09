require! <[ ./Base ./Element ./Contour ./Fill ]>

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

    fills = if rect or oval
            then (xml.$ 'fill/*' .children).map Fill
            else (xml.$ 'fills/FillStyle/*' .children).map Fill

    if fills.length
      # TODO: no idea how contours works
      fills = [ new Fill ] ++ fills
      @contours = fills.map ->
        new Contour
          ..fill = it

    @is-drawing-object   = -> drawing
    @is-group            = -> group
    @is-rectangle-object = -> rect
    @is-oval-object      = -> oval
