USING: kernel sequences ascii combinators io math math.ranges random math.parser ;
IN: day2.numberguess

: numberguess' ( n -- )
  dup
  readln string>number {
    { [ 2dup > ] [ "Higher" print 2drop numberguess' ] }
    { [ 2dup < ] [ "Lower" print 2drop numberguess' ] }
    [ "Winner" print 3drop ]
  } cond
; inline recursive

: numberguess ( -- ) 100 [1,b] "Guess" print random numberguess' ;
