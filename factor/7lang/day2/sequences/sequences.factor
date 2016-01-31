USING: kernel sequences ascii combinators io ;
IN: day2.sequences

: find-first ( seq quot: ( x y -- ? ) -- elt ) {
  { [ [ dup ] dip swap length 0 = ] [ 2drop f ] }
  { [ 2dup [ first ] dip call ] [ swap first nip ] }
  [ [ 1 tail ] dip [ find-first ] call ]
} cond ; inline recursive
