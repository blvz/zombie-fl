require! <[ ./Base ../helpers/color ]>

module.exports = class Fill extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

    colors = if xml then parse-colors that else []

    if colors.length is 1
      @style = \solid
      clr = color colors.0
      @ <<< color:~
            \   -> clr!
            (c) -> clr c

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
  clr = color xml.attr \color
  clr.alpha parse-float that if xml.attr \alpha
  clr!

function parse-gradient xml
  (xml.$ \GradientEntry .children).map parse-color
