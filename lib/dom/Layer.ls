require! <[ ./Base ./Frame chroma-js ]>

module.exports = class Layer extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

    clr = chroma-js xml.attr \color
    fs  = Frame.fill-gaps <| (xml.$ 'frames/*' .children).map Frame

    @frames         = fs
    @frame-count    = fs.length
    @visible        = not ((xml.attr \visible) is \false)
    @name           =  xml.attr \name
    @locked         = (xml.attr \locked) is \true
    @outline        = (xml.attr \outline) is \true
    @parent-layer   =  xml.attr \parentLayerIndex
    @animation-type = (xml.attr \animationType) or \none
    @layer-type     = (xml.attr \layerType) or \normal
    @height         = ((parse-int xml.attr \heightMultiplier) or 1) * 100

    @ <<<
      color:~
        \   -> clr.hex!to-upper-case!
        (c) -> clr := chroma-js c

  @map-parents = (ls) ->
    for l in ls
      if l.parent-layer?
        p = l.parent-layer = l.parent-layer |> parse-int |> (ls .)
        l.layer-type = switch p.layer-type
                       | \mask     => \masked
                       | \guide    => \guided
                       | otherwise => l.layer-type
      l
