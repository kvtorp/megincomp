
triple_extrude( 
    [[0,0],[48,0], [49,2], [52,38], [51.5,39], [51,39.5], [50,40], 
        [41,40],[39, 39], [2, 11], [0,11]], 
    [[4,0], [6.5,0], [7,1], [7.67,2], [8,3], [8,4], [7.67,5],
        [7,6], [6,8], [5.5,9], [5,11], [5,40],
        [3,40], [3,11], [2.5,9], [2,8], [1,6], [0.33,5], [0,4], [0,3], 
        [0.33,2], [1,1], [1.5,0] ], 
    [[0,0], [8,0], [8,2], [5, 41], [5, 52],    
        [3,52], [3,41], [0,2]]);



module triple_extrude( x_shape, y_shape, z_shape ) {
x_translate = -extrude_x_width(x_shape, y_shape, z_shape) / 2;

translate([x_translate, 0, 0])
intersection() {
    
// Langs z-aksen
linear_extrude( height = extrude_z_width(x_shape, y_shape, z_shape), center = false )
polygon( z_shape );

// Langs y-aksen
mirror([0,1,0])
rotate([90, 0, 0])
linear_extrude( height = extrude_y_width(x_shape, y_shape, z_shape), center = false )
polygon( y_shape );

rotate([90, 0, 0]) rotate([0, 90, 0])
linear_extrude( height = extrude_x_width(x_shape, y_shape, z_shape), center = false )
polygon( x_shape );
}
}

module triple_extrude_debug( x_shape, y_shape, z_shape) {

union() {
    
// Langs z-aksen
color("red") 
translate([0,0,-1])
linear_extrude( height = extrude_z_width(x_shape, y_shape, z_shape)+2, center = false )
polygon( z_shape );

// Langs y-aksen
color("blue")
mirror([0,1,0])
rotate([90, 0, 0])
translate([0,0,-1])
linear_extrude( height = extrude_y_width(x_shape, y_shape, z_shape)+2, center = false )
polygon( y_shape );

color("green")
rotate([90, 0, 0]) rotate([0, 90, 0])
translate([0,0,-1])
linear_extrude( height = extrude_x_width(x_shape, y_shape, z_shape)+2, center = false )
polygon( x_shape );
}
}

function total_max(cls) = 
    max (
        [ for ( cl = cls )
            coord_list_max(cl)
         ]
    );

function coord_list_max(cl) = max(x_max(cl), y_max(cl));

function x_max( cl ) = max([ for ( c = cl ) c[0] ]);

function y_max( cl ) = max([ for ( c = cl ) c[1] ]);
        
function extrude_x_width(x_shape, y_shape, z_shape) = min( x_max( y_shape ), x_max( z_shape ));
function extrude_y_width(x_shape, y_shape, z_shape) = min( x_max( x_shape ), y_max( z_shape ));
function extrude_z_width(x_shape, y_shape, z_shape) = min( y_max( x_shape ), y_max( y_shape ));

        
        