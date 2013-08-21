class @EasyDate
  constructor: (args...) ->
    @date = ''

    if args.length > 1
      day   = args[2]
      month = args[1]
      year  = args[0]

      @date = new Date year, month, day
    else
      day   = args[0].split(/(\d{2})/)[1]
      month = args[0].split(/(\d{2})/)[3]
      year  = args[0].split(/(\d{2})/)[5]

      yearIn19s = "19#{year}"
      yearIn20s = "20#{year}"

      tmp_date = new EasyDate yearIn19s, month, day

      unless tmp_date.yearsAgo() < 100
        tmp_date = new EasyDate yearIn20s, month, day

      @date = new Date tmp_date.year(), tmp_date.month(), tmp_date.day()

  year: ->
    @date.getFullYear()

  month: ->
    @date.getMonth()

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
