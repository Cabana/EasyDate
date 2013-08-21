describe EasyDate, ->
  describe 'when instantiated with no args', ->
    it 'returns the current date', ->
      expect(new EasyDate).toEqual jasmine.any(Date)
