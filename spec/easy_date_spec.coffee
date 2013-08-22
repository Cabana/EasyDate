describe 'EasyDate', ->
  date = new Object

  it 'throws an error if the date is invalid', ->
    expect(-> new EasyDate 2000, 4, 32).toThrow 'Invalid date'
    expect(-> new EasyDate '320400').toThrow 'Invalid date'

  it 'does not throw and error if the date is valid', ->
    expect(-> new EasyDate 2000, 4, 14).not.toThrow 'Invalid date'

  describe '#year', ->
    it 'returns the year of the date', ->
      date = new EasyDate 2000, 10, 15
      expect(date.year()).toEqual 2000

  describe '#month', ->
    it 'returns the month of the date', ->
      date = new EasyDate 2000, 10, 15
      expect(date.month()).toEqual 10

  describe '#day', ->
    it 'returns the day of the date', ->
      date = new EasyDate 2000, 10, 15
      expect(date.day()).toEqual 15

  describe '#isFuture', ->
    it 'returns true if the value is in the future', ->
      date = new EasyDate 2100, 10, 15
      expect(date.isFuture()).toEqual true

    it 'returns false if the value is in the past', ->
      date = new EasyDate 2000, 10, 15
      expect(date.isFuture()).toEqual false

  describe '#isPast', ->
    it 'returns true if the value is in the future', ->
      date = new EasyDate 2100, 10, 15
      expect(date.isPast()).toEqual false

    it 'returns false if the value is in the past', ->
      date = new EasyDate 2000, 10, 15
      expect(date.isPast()).toEqual true

  describe '#yearsAgo', ->
    it 'returns how many years ago the date was', ->
      currentYear = new Date().getFullYear()
      yearsAgo = currentYear - 1990
      date = new EasyDate 1990, 10, 15
      expect(date.yearsAgo()).toEqual yearsAgo

  describe '#yearsUntil', ->
    it 'returns how many years until the date', ->
      currentYear = new Date().getFullYear()
      yearsUntil = 3000 - currentYear
      date = new EasyDate 3000, 10, 15
      expect(date.yearsUntil()).toEqual yearsUntil

  describe 'instantiating with a shorthand date', ->
    it 'works with years in the 19s', ->
      date = new EasyDate '060890'
      expect(date.year()).toEqual 1990
      expect(date.month()).toEqual 8
      expect(date.day()).toEqual 6

    it 'works with years in the 20s', ->
      date = new EasyDate '010901'
      expect(date.year()).toEqual 2001
      expect(date.month()).toEqual 9
      expect(date.day()).toEqual 1
