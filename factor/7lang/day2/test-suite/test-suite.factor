USING: tools.test io io.streams.null kernel namespaces sequences ;

USE: day2.strings
USE: day2.sequences
USE: day2.numberguess
IN: day2.test-suite

: test-all-day2 ( -- )
    [ "day2" test ] with-null-writer
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-day2
