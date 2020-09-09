USING: kernel math sequences accessors io classes ;
IN: example.cart

CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975
CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.00

TUPLE: cart-item name price quantity ; 
TUPLE: checkout item-count base-price taxes shipping total-price ;

! define-reader ( class slot-spec -- )

! M: checkout equal? over checkout instance? [ dup checkout instance? [ [ dup item-count>> ] bi@ = ] [ f ] ? ] [ f ] if ;

: sum ( seq -- n ) 0 [ + ] reduce ;
: cart-item-count ( carts -- count ) [ quantity>> ] map sum ;
: cart-item-price ( item -- price ) [ quantity>> ] [ price>> ] bi * ;
: cart-base-price ( carts -- price ) [ cart-item-price ] map sum ;
: <cart-item> ( name price size -- cart-item ) cart-item boa ; 
: <base-item> ( price size -- cart-item ) f swap pick cart-item boa swap drop ;
: <base-checkout> ( item-count base-price -- checkout ) f f f checkout boa ;
: <checkout> ( carts -- checkout ) [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;
: gst-pst ( price -- taxes ) [ gst-rate * ] [ pst-rate * ] bi + ;
: taxes ( checkout taxes-calc -- calcedCheckout ) [ dup base-price>> ] dip call >>taxes ; inline
: per-item ( item-count -- shipping ) per-item-shipping * base-shipping + ;
: shipping ( checkout shipping-calc -- calcedCheckout ) [ dup item-count>> ] dip call >>shipping ; inline
: total ( checkout -- total-price-checkout ) dup [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ; 
: sample-checkout ( checkout -- checkout ) [ gst-pst ] taxes [ per-item ] shipping total ; 
