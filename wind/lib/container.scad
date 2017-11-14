use <threads.scad>;
use <camfer.scad>;


module lid(thread_height = 4) {
	difference () {
		union() {
			translate([0,0,1])
            difference() {
				metric_thread (diameter=55, pitch=2, length=thread_height+3, internal=false, n_starts=2);
                circular_camfer(25.5, 45, "triangular");
                translate([0,0,thread_height+3])
                circular_camfer(25.5, -45, "triangular");
            }
			cylinder(r=25.5, h=thread_height + 4, $fn=100);
		}

		translate([13,0,2])
			cylinder(r=10, h=thread_height + 3, $fn=100);
		rotate([0,0,120])
			translate([13,0,2])
			cylinder(r=10, h=thread_height + 3, $fn=100);
		rotate([0,0,-120])
			translate([13,0,2])
			cylinder(r=10, h=thread_height + 3, $fn=100);
	}
}


box();

module flange(inner_height = 30, thread_height = 4) {
	// Align to XY plane
	translate([0,0,34])
		rotate([0,90,0])
		rotate([0,0,-60])
	// The flange itself
	union() {
		difference() {
			// The stick
			rotate([0,0,-30])
				linear_extrude(height=inner_height+2+1+thread_height+40)
				translate([0,30,0])
				polygon(back_and_forth([[6,-20],[6,4]]));
	
			// Cutout for main housing
			translate([0,0,-1])
				cylinder(r=30, h=inner_height + 3 + thread_height + 1, $fn=100);
			// Cutout with room for lid
			translate([0,0,inner_height + 3 + thread_height - 1])
				cylinder(r=29, h=11, $fn=100);
			// Cutout for mast top
			translate([0,0,inner_height + 3 + thread_height + 10 - 1])
				cylinder(r=20, h=32, $fn=100);
			// Pretty at the bottom
			circular_camfer(radius=29, camfing=45, style="triangular");
	
			rotate([0,0,-30])
				linear_extrude(height=inner_height+2+1+thread_height)
				translate([0,30,0])
				polygon(back_and_forth([[2.2,-1],[2.2,0.2],[4,2]]));
	
			rotate([0,0,-30])
				translate([-2,34.5,inner_height+2 +3 -15])				
				rotate([90,0,0])
				linear_extrude(height=3)
				square([4,15]);
		}
	
		// Small flange for notch
		rotate([0,0,-30])
			translate([-1.5,34,inner_height+2 +3 -15])				
			rotate([90,0,0])
			linear_extrude(height=1)
			square([3,14]);
					
		// Notch
		rotate([0,0,60])
			translate([0,0,inner_height+2])			
			rotate([90,0,0])
			translate([30,0,0])
			linear_extrude(height=3, center=true)
			polygon([[1,-0.9], [1,0.9], [2.1,2], [3, 2], [3,-2.9]]);
	}
}

module box(inner_height = 30, thread_height = 4) {

nookCrossSection = [[0.5,0.5], [3,3], [3,-3], [0.5,-0.5]];

union() {
	difference() {
		union() {
			difference() {
			union() {
				rotate([0,0,-30])
				linear_extrude(height=inner_height+2+1+thread_height)
					translate([0,30,0])
					polygon(back_and_forth([[1,-1],[3.8,1.8],[3.8,2]]));
				rotate([0,0,90])
				linear_extrude(height=inner_height+2+1+thread_height)
					translate([0,30,0])
					polygon(back_and_forth([[1,-1],[3.8,1.8],[3.8,2]]));
				rotate([0,0,210])
				linear_extrude(height=inner_height+2+1+thread_height)
					translate([0,30,0])
					polygon(back_and_forth([[1,-1],[3.8,1.8],[3.8,2]]));
			}
				
			rotate([0,0,60])
				translate([0,0,inner_height+2])			
				rotate([90,0,0])
				translate([30,0,0])
				linear_extrude(height=4, center=true)
				polygon(nookCrossSection);
			rotate([0,0,-60])
				translate([0,0,inner_height+2])			
				rotate([90,0,0])
				translate([30,0,0])
				linear_extrude(height=4, center=true)
				polygon(nookCrossSection);
			rotate([0,0,180])
				translate([0,0,inner_height+2])			
				rotate([90,0,0])
				translate([30,0,0])
				linear_extrude(height=4, center=true)
				polygon(nookCrossSection);
		}
			
			difference() {
				translate([29,0,0])
				linear_extrude(height = min(10,inner_height) + 2)
				polygon([[0,-2],[0,2],[2.5,0]]);
				translate([0,0,min(10,inner_height)+2])
				rotate([180,0,0])
				circular_camfer(radius=30, camfing=45, style="triangular");
			}
		}
		
		circular_camfer(radius=29, camfing=45, style="triangular");
		translate([0,0,inner_height+2+1+thread_height])
			rotate([180,0,0])
			circular_camfer(radius=30, camfing=60, style="triangular");
	}
}

difference() {
    union() {
difference() {
cylinder(r=30, h=inner_height + 3 + thread_height, $fn=100);
    translate([0,0,2])
cylinder(r=28, h=inner_height+1, $fn=100);
translate([0, 0, inner_height+2])
metric_thread (diameter=55, pitch=2, length=thread_height+2, internal=true, n_starts=2);
		circular_camfer(radius=29, camfing=45, style="triangular");
}
translate([-5,-5,0])
        cube([10,10,4], center=false);
    }
rotate([0,0,45])
translate([0, -2.5, -0.5])
    cylinder(r=1,h=5,$fn=6);
rotate([0,0,45])
translate([0, 2.5, -0.5])
    cylinder(r=1,h=5,$fn=6);
}


translate([0,0,inner_height - 1])
difference() {
cylinder(r=28, h=3, $fn=100);
translate([0,0,-3])
cylinder(r1=30, r2=24, h=9, $fn=100);
}
}