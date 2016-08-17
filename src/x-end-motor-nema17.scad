// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../inc/x-end.scad>

module x_end_motor_base()
{
  x_end_base();
  translate([-15,31,26.5]) cube([17,44,53], center=true);
}

module x_end_motor_holes()
{
  x_end_holes();

  // Position to place
  translate([-1,32,30.25]) {
    // Belt hole
    translate([-14,1,0]) cube([10,46,22], center=true);
    // Motor mounting holes
    translate([20,-15.5,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=1.8, $fn=30);
    translate([1,-15.5,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10, r=3.1, $fn=30);

    translate([20,-15.5,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=1.8, $fn=30);
    translate([1,-15.5,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10, r=3.1, $fn=30);


    translate([20,15.5,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=1.8, $fn=30);
    translate([1,15.5,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10, r=3.1, $fn=30);


    translate([20,15.5,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=1.8, $fn=30);
    translate([1,15.5,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10, r=3.1, $fn=30);

    // Material saving cutout
    translate([-10,12,10]) cube([60,42,42], center=true);

    // Material saving cutout
    translate([-10,40,-30]) rotate([45,0,0])  cube([60,42,42], center=true);
    // Motor shaft cutout
    translate([0,0,0]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=17, $fn=6);
  }
}

// Final part
module x_end_motor()
{
  difference() {
    x_end_motor_base();
    x_end_motor_holes();
  }
}
x_end_motor();
% translate([-40.3,32,30.25]) rotate([0,90,0]) import("../inc/nema17.stl", convexity=3);
