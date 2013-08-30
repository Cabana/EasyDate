class @EasyDate
  constructor: (args...) ->
    date = this._constructDate args

    @date = new Date date.year, date.month, date.day

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

  _constructDate: (args) ->
    if this._isShothandDate args
      day   = args[2]
      month = args[1] - 1
      year  = args[0]
    else
      # parse the different formats that a date can have
      # yymmdd
      # yyyy-mm-dd
      # dd-mm-yyyy
      if this._isCprFormattedDate args[0]
        year  = this._y2kFix split(args[0], /(\d{2})/)[5]
        month = parseInt(split(args[0], /(\d{2})/)[3], 10) - 1
        day   = parseInt split(args[0], /(\d{2})/)[1], 10
      else if this._isLongFormattedDateWithYearFirst args[0]
        year  = parseInt split(args[0], /-/)[0], 10
        month = parseInt(split(args[0], /-/)[1], 10) - 1
        day   = parseInt split(args[0], /-/)[2], 10
      else if this._isLongFormattedDateWithYearLast args[0]
        year  = parseInt split(args[0], /-/)[2], 10
        month = parseInt(split(args[0], /-/)[1], 10) - 1
        day   = parseInt split(args[0], /-/)[0], 10

    throw new Error 'Invalid date' unless this._dateValid year, month, day

    { year: year, month: month, day: day }

  _isShothandDate: (args) ->
    args.length > 1

  _isCprFormattedDate: (date) ->
    /^\d{6}$/.test date

  _isLongFormattedDateWithYearFirst: (date) ->
    /^\d{4}-\d{2}-\d{2}$/.test date

  _isLongFormattedDateWithYearLast: (date) ->
    /^\d{2}-\d{2}-\d{4}$/.test date

  _y2kFix: (year) ->
    yearIn20s = parseInt "20#{year}", 10
    yearIn19s = parseInt "19#{year}", 10
    currentYear = new Date().getFullYear()

    if currentYear - yearIn19s > 100
      yearIn20s
    else
      yearIn19s

  _dateValid: (year, month, day) ->
    month = month - 1
    month = 0 if month < 0

    date = new Date year, month, day

    if date.getFullYear() is year and date.getMonth() is month and date.getDate() is day
      true
    else
      false
