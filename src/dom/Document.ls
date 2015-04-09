require! <[ ./Base ./Timeline ]>

module.exports = class Document extends Base
  (file, xml) ->
    return new @@ ... unless @ instanceof @@

    @name = file - /^.*\//
    @path = file

    ts                = xml.$ 'timelines/*' .children
    @current-timeline = 'currentTimeline' |> xml.attr |> parse-int |> (- 1)
    @timelines        = ts.map Timeline

  get-timeline: -> @timelines[@current-timeline]
