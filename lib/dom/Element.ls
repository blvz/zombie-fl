require! <[ ./Base ]>

module.exports = class Element extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

  @mapper = (xml) ->
    element-class = switch xml.name
                    | \DOMGroup           => fallthrough
                    | \DOMOvalObject      => fallthrough
                    | \DOMRectangleObject => fallthrough
                    | \DOMShape           => require './Shape'
                    | \DOMSymbolInstance  => require './SymbolInstance'
                    | \DOMBitmapInstance  => require './BitmapInstance'
                    | otherwise           => Element

    new element-class xml
