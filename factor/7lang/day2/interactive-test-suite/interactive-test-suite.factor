USING: tools.test io io.streams.null kernel namespaces sequences regexp io.streams.string math.parser vocabs splitting ;

IN: day2.interactive-test-suite

: interactive-test ( -- )
    "Vocabulary? " write flush
    readln " " split
    [ dup print
      dup load-vocab drop [ test ] with-string-writer
      R/ ^Unit Test:/m count-matches
      number>string "Unit Tests: " swap append print
      test-failures get empty?
      [ "All tests passed." print ] [ :test-failures ] if
    ] each ;

MAIN: interactive-test
