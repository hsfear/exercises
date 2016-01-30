USING: tools.test io io.streams.null kernel namespaces sequences ;

IN: day1.test-suite

: test-all-day1 ( -- )
    [ "day1" test ] with-null-writer
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-day1
