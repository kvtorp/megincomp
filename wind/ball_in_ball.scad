
// Ydre radius
ydre = 17;
// Ringtykkelse
tykkelse = 3;

// Højde
hojde = 10;

// Indre radius
indre = ydre - tykkelse - 0.5;


skal(ydre, tykkelse, 10);
skal(indre, tykkelse, 10);

module skal(radius, thickness, height) {
intersection() {
    difference() {
        sphere( r = radius, $fn=100 );
        sphere( r = radius - thickness, $fn=100 );
    };

translate([-radius, -radius, -height/2])    
    cube([2 * radius, 2*radius, height]);
}
}

module ydreskal(radius, thickness, height) {
intersection() {
    difference() {
        cylinder( h = height, r = radius, $fn=100, center=true );
        sphere( r = radius - thickness, $fn=100 );
    };

translate([-radius, -radius, -height/2])    
    cube([2 * radius, 2*radius, height]);
}
}

