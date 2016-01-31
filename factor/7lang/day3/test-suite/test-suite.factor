USING: tools.test io io.streams.null kernel namespaces sequences regexp io.streams.string math.parser ;

USE: day3.tuples
IN: day3.test-suite

: test-all-day3 ( -- )
    [ "day3" test ] with-string-writer
    R/ ^Unit Test:/m count-matches
    number>string "Unit Tests: " swap append print
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-day3
