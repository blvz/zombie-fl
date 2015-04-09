require! <[ chroma-js ]>

export
  function fl-rgba
    it = chroma-js it unless it.alpha?
    do
      switch it.alpha!
      | 1 => it.hex!
      | _ => it.hex \rgba
    .to-upper-case!
