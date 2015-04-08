require! <[ chroma-js ]>

# TODO: fix these properly
module.exports = ->
  c = chroma-js it
  c.alpha a / 255 if (a = c.alpha!) > 1
  (-> | it? => c := chroma-js it
      | _   => h3x c)
    ..alpha = c~alpha

function h3x c
  a = if (a = c.alpha!) < 1
      then Math.round(a * 255).to-string 16
      else ''
  (c.hex! + a).to-upper-case!
