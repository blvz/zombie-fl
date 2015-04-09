require! <[ ./Base ]>

module.exports = class SymbolInstance extends Base
  (xml) ->
    return new @@ ... unless @ instanceof @@
