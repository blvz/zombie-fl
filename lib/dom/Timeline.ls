require! <[ ./Base ./Layer ]>

module.exports = class Timeline extends Base
  ({$, $$}) ->
    return new @@ ... unless @ instanceof @@

    ls = $$?layers?0.$$.DOMLayer or []
    @name = $.name
    @layers = ls.map Layer _, ls
