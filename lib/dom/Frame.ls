require! <[ ./Base ]>

module.exports = class Frame extends Base
  ({$, $$}) ->
    return new @@ ... unless @ instanceof @@

    es = $$?elements or []
    es = [] if es.0 is ''

    @name          = $.name or ''
    @elements      = es
    @duration      = (parse-int $.duration) or 1
    @label-type    = $.label-type or ''
    @start-frame   = parse-int $.index
    @action-script = $$?Actionscript?0.$$.script.0 or ''

  is-empty: -> not @elements.length

  @fill-gaps = (fs) -> [ f for f in fs for [ 0 til f.duration ] ]
