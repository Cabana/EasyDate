class @EasyDate
  constructor: (args...) ->
    date = this._constructDate args

    @date = new Date date.year, date.month, date.day

  _constructDate: (args) ->
    if args.length > 1
      day   = args[2]
      month = args[1] - 1
      year  = args[0]
    else
      day   = parseInt split(args[0], /(\d{2})/)[1], 10
      month = parseInt(split(args[0], /(\d{2})/)[3], 10) - 1
      year  = split(args[0], /(\d{2})/)[5]

      yearIn20s = parseInt "20#{year}", 10
      yearIn19s = parseInt "19#{year}", 10
      currentYear = new Date().getFullYear()

      if currentYear - yearIn19s > 100
        year = yearIn20s
      else
        year = yearIn19s

    throw new Error 'Invalid date' unless dateValid year, month, day

    { year: year, month: month, day: day }

  dateValid = (year, month, day) ->
    month = month - 1
    month = 0 if month < 0

    date = new Date year, month, day

    if date.getFullYear() is year and date.getMonth() is month and date.getDate() is day
      true
    else
      false

  year: ->
    @date.getFullYear()

  month: ->
    @date.getMonth() + 1

  day: ->
    @date.getDate()

  isFuture: ->
    if @date - new Date() < 0
      false
    else
      true

  isPast: ->
    if @date - new Date() > 0
      false
    else
      true

  yearsAgo: ->
    new Date().getFullYear() - this.year()

  yearsUntil: ->
    this.year() - new Date().getFullYear()
