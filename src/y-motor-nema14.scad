// PRUSA iteration3
// Y motor mount
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

//include <configuration.scad>

module y_motor_base()
{
  // Motor holding part
  translate([29,-21+50,0]) {
    translate([-21+4.5,-2.5,5]) cube(size=[9,26,10], center=true);
    translate([-15.5,-15.5,0]) cylinder(h=10, r=5.5);
    translate([-15.5,+10.5,0]) cylinder(h=10, r=5.5);
    // Joins motor holder and rod plate
    translate([-29,-21,0]) cube(size=[14,30,10]);
  }
  // Front holding part
  translate([0,10,0]) cylinder(h=10, r=8);
  translate([0,20,5])cube(size=[16,20,10], center=true);
  translate([0,30,0])cylinder(h=10, r=8);
}

module y_motor_holes()
{
  translate([29,-21+50,0]) {
    // Screw head holes
    translate([-15.5,-15.5,-1]) cylinder(h=10, r=1.7);
    translate([-15.5,+10.5,-1]) cylinder(h=10, r=1.7);
    // Screw holes
    translate([-15.5,-15.5,7]) cylinder(h=7, r=3.5);
    translate([-15.5,+10.5,7]) cylinder(h=7, r=3.5);
  }
  translate([0,10,-1]) cylinder(h=12, r=4.5);
  translate([0,30,-1]) cylinder(h=12, r=4.5);
}

// Final part
module y_motor()
{
  difference() {
    y_motor_base();
    y_motor_holes();
    translate([26.5,26.5,-2]) cylinder(d=26, h=14);
  }
  % translate([26.5,26.5,0]) import("../inc/nema14.stl", convexity=3);
}

y_motor();
