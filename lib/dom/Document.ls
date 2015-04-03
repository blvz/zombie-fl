require! <[ ./Base ./Timeline ]>

module.exports = class Document extends Base
  (file, xml-obj) ->
    return new @@ ... unless @ instanceof @@

    @name = file - /^.*\//
    @path = file

    {$, $$} = xml-obj
    ts = $$.timelines.0.$$.DOMTimeline
    @current-timeline = $.current-timeline |> parse-int |> (- 1)
    @timelines = ts.map Timeline

  get-timeline: -> @timelines[@current-timeline]
