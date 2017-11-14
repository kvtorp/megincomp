use <lib/threads2.scad>;
use <lib/camfer.scad>;


difference() {
cylinder(r=29, h=4, $fn=100);
color("blue")
translate([0,0,4.5])
circular_camfer(radius=21, camfing=45, style="triangular",width=6,height=4);
translate([0, 0, -0.5])
metric_thread (diameter=52, pitch=3, length=5, internal=true, n_starts=4, clearance = 0.5, $fn=128);
//		circular_camfer(radius=29, camfing=45, style="triangular");
}



translate([100,0,0]){
difference() {
//    cylinder(r=27.5,h=4,$fn=128);
metric_thread (diameter=52, pitch=3, length=4, internal=false, n_starts=4, clearance = 0.5, $fn=128);
fingerhole();
    rotate([0,0,120])
fingerhole();
    rotate([0,0,240])
fingerhole();
circular_camfer(radius=25.87, camfing=45, style="triangular");
translate([0,0,4])
circular_camfer(radius=25.87, camfing=-45, style="triangular");
}
}

module fingerhole() {
translate([-12,0,-0.5])
    rotate([0,0,0])
    cylinder(r=11,h=5,$fn=6);
    
    rotate([0,0,60])
intersection() {
translate([-12,0,-0.5])
    rotate([0,0,0])
    cylinder(r=11,h=5,$fn=6);
translate([-24,0,-0.5])
    rotate([0,0,0])
    cylinder(r=11,h=5,$fn=6);
}
}