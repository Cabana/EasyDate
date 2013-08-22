# Easy Date

EasyDate is a JavaScript class that makes doing certain things with dates a little easier. Its been test across all modern browsers and IE8+.

## Using it

```javascript
// You instantiate it just like you would a Date()
// new EasyDate(yyyy, mm, dd);
var date = new EasyDate(2013, 4, 9);

// You can also instantiate it with a shorthand date in the format ddmmyy
var date = new EasyDate('060890');
// In order to avoid Y2K issues (is '010113' the year 1913 or 2013?) it will assume that the date is in the 19s however if that is more than 100 years ago then it will change the date to be in the 20s.

// Assume that we have this date
var date = new EasyDate(2000, 4, 9);

// We can call the following methods on it
date.year()       // => 2000
date.month()      // => 4
date.day()        // => 9
date.isFuture()   // => false
date.isPast()     // => true
date.yearsAgo()   // => 13
date.yearsUntil() // => -13
```

## Running the test suite

Use [karma](http://karma-runner.github.io/).
