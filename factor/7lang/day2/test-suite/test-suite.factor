USING: day2.strings day2.sequences tools.test io io.streams.null kernel namespaces sequences ;

IN: day2.test-suite

: test-all-day2 ( -- )
    [ "day2" test ] with-null-writer
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-day2
