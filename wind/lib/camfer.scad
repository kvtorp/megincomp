function reverse_list(list) = [ for (idx = [len(list) - 1 : -1 : 0]) list[idx] ];
function xmirror(list) = [ for ( e = list ) [-e[0], e[1]]];
function back_and_forth(list) = concat(list, reverse_list(xmirror(list)));


module circular_shape_camfer(radius, shape) {
	rotate_extrude($fn=100)
	translate([radius,0,0])
	polygon(shape);
}

module circular_camfer(radius, camfing, style, width = 10, height=10) {
	if (style == "circular") {
		difference () {
			translate([0,0,-30])
				cylinder(r = radius + camfing+30, h=camfing+30, $fn=100);
			translate([0,0,-31])
				cylinder(r = radius, h=camfing+32, $fn=100);
			translate([0,0,camfing])
				rotate_extrude($fn=100)
				translate([radius,0,0])
				circle(r=camfing, $fn=32);
		}
	}

	if (style == "triangular") {
		rotate_extrude($fn=100)
			translate([radius,0,0])
			rotate([0,0,-90-camfing])
			polygon([[-width,0],[width,0],[width,height],[-width,height]]);
	}
}
