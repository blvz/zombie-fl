require! <[ ./Base ./Element ]>

module.exports = class Frame extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@

    es = xml.$ 'elements/*' .children

    @name          = (xml.attr \name) or ''
    @label-type    = (xml.attr \labelType) or ''
    @duration      = (parse-int xml.attr \duration) or 1
    @start-frame   =  parse-int xml.attr \index
    @elements      = es.map Element.mapper
    @action-script = (xml.$ 'Actionscript/script'
                      .children.0?children.0.raw-data.join '') or ''

  is-empty: -> not @elements.length

  @fill-gaps = (fs) -> [ f for f in fs for [ 0 til f.duration ] ]
