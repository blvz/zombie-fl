require! <[ ./Base ./Frame ]>

module.exports = class Layer extends Base
  ({$, $$}, layers) ->
    return new @@ ... unless @ instanceof @@

    clr    = $.color
    parent = null
    fs     = Frame.fill-gaps <| ($$?frames?0.$$.DOMFrame or [])
                                .map Frame

    if $.parent-layer-index
      parent = new Layer layers[$.parent-layer-index], layers

    @name           = $.name
    @locked         = $.locked is \true
    @outline        = $.outline is \true
    @visible        = not ($.visible is \false)
    @height         = ((parse-int $.height-multiplier) or 1) * 100
    @frames         = fs
    @frame-count    = fs.length
    @parent-layer   = parent
    @animation-type = $.animation-type or \none
    @layer-type     = switch parent?layer-type
                      | \mask     => \masked
                      | \guide    => \guided
                      | otherwise => $.layer-type or \normal

    @ <<<
      color:~
        \   -> clr
        (c) ->
          clr :=
            switch typeof c
            | \string
              c.to-upper-case!
            | \number =>
              \# + ('00000' + (c .|. 0).to-string 16).substr -6
              .to-upper-case!
