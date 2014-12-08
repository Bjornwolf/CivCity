class EventStream
  constructor: (@options = {}, @stream = undefined) ->
    unless @stream?
      streamType = EventStream.subjectType(@options.repeating)
      @stream = new streamType()

  publish: (eventName, args...) =>
    @stream.onNext.call(@stream, [eventName].concat(args))

  on: (eventName, callback) =>
    @stream.filter((ev) =>
      ev[0] is eventName).
    subscribe (args) =>
      callback(args.slice(1)...)

  @subjectType: (repeating) =>
    return Rx.ReplaySubject if repeating
    Rx.Subject

module.exports = EventStream
