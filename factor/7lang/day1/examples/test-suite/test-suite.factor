USING: tools.test io io.streams.null kernel namespaces sequences ;

USE: day1.examples.greeter
IN: day1.examples.test-suite

: test-all-examples ( -- )
    [ "examples" test ] with-null-writer
    test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-examples
