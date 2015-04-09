require! <[ chroma-js ./Base ]>
require! { '../helpers/color': { fl-rgba } }

module.exports = class Fill extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

    colors = if xml then parse-colors that else []

    if colors.length is 1
      @style = \solid
      clr = chroma-js colors.0
      @ <<< color:~
            \   -> fl-rgba clr
            (c) -> clr := chroma-js c

    else if colors.length
      @style       = xml.name.char-at 0 .to-lower-case! + xml.name.substr 1
      @color-array = colors.concat!
      @overflow    = (xml.attr \spreadMethod) or \extend
      @pos-array   = (xml.$ \GradientEntry .children).map ->
        it.attr \ratio |> parse-float |> (* 255) |> Math.round

    else if xml?name is \BitmapFill
      @style       = \bitmap
      @bitmap-path = xml.attr \bitmapPath

  style: \noFill
  to-string: -> '[object Object]'

function parse-colors xml
  switch xml.name
  | \SolidColor     => [ parse-color ... ]
  | \LinearGradient => parse-gradient ...
  | \RadialGradient => parse-gradient ...
  | otherwise       => []

function parse-color xml
  clr = chroma-js xml.attr \color
  clr.alpha parse-float that if xml.attr \alpha
  fl-rgba clr

function parse-gradient xml
  (xml.$ \GradientEntry .children).map parse-color
