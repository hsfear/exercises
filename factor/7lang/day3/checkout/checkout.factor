USING: kernel accessors locals
  math math.order math.functions math.parser
  sequences sequences.repeating ;

IN: day3.checkout

TUPLE: cart-item name price quantity ;
! START:checkout_tuple
TUPLE: checkout item-count base-price taxes shipping total-price ;
! END:checkout_tuple

: <cart-item> ( name price quantity -- cart-item ) cart-item boa ;

! START:utils
: sum ( seq -- n ) 0 [ + ] reduce ; ! (1)
: cart-item-count ( cart -- count ) [ quantity>> ] map sum ; ! (2)
: cart-item-price ( cart-item -- price ) [ price>> ] [ quantity>> ] bi * ; !  (3)
: cart-base-price ( cart -- price ) [ cart-item-price ] map sum ; ! (4)
! END:utils

! START:cart_checkout
: <base-checkout> ( item-count base-price -- checkout ) ! (5)
    f f f checkout boa ;

: <checkout> ( cart -- checkout ) ! (6)
    [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;
! END:cart_checkout

! START:taxes
CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975
CONSTANT: sales-tax-rate 0.10

: gst-pst ( price -- taxes ) [ gst-rate * ] [ pst-rate * ] bi + ;
: sales-tax ( price -- taxes ) sales-tax-rate * ;

: taxes ( checkout taxes-calc -- taxes )
    [ dup base-price>> ] dip
    call >>taxes ; inline
! END:taxes

! START:shipping
CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.00
CONSTANT: per-item-us-shipping 2.00

: per-item ( checkout -- shipping ) per-item-shipping * base-shipping + ;
: per-us-item ( checkout -- shipping ) per-item-us-shipping * base-shipping + ;

: shipping ( checkout shipping-calc -- shipping )
    [ dup item-count>> ] dip
    call >>shipping ; inline
! END:shipping

! START:total
: total ( checkout -- total-price ) dup
    [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ;
! END:total

! START:sample_checkout
: sample-checkout ( checkout -- checkout )
    [ gst-pst ] taxes [ per-item ] shipping total ;
! END:sample_checkout

! START:sample_us_checkout
: sample-us-checkout ( checkout -- checkout )
    [ sales-tax ] taxes [ per-us-item ] shipping total ;
! END:sample_checkout

