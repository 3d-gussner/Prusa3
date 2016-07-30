// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../inc/bearing.scad>
use <polyholes.scad>
rod_distance=45;

module x_end_base()
{
  // Main block
  height=58;
  translate([-15,-9,height/2]) cube([17,39,height], center=true);

  // Bearing holder
  vertical_bearing_base();

  // Nut trap
  translate([0, -17-5, 0]) {
    difference() {
      // Hexagon
      cylinder(h=10.2, d=27, $fn=24);
      // Nut trap
      translate([0, 0, -0.5]) poly_cylinder(h=16, r=5.1, $fn=25);
      for (a=[0:90:269]) {
          rotate([0,0,a-90]) translate([(22/2)-(3.5/2)-1.2,0,-6]) cylinder(d=3.5, h=20, $fn=16);
      }
    }
  }
}

module x_end_holes()
{
  vertical_bearing_holes();

  // Belt hole
  translate([-1,0,0]) {

    // Stress relief
    translate([-5.5-10+1.5, -10-1, 30]) cube([20,1,28], center=true);
    difference() {
      translate([-5.5-10+1.5, -10, 30]) cube([10,46,28], center=true);

      // Nice edges
      translate([-5.5-10+1.5, -10, 30+23]) rotate([0, +45, 0]) cube([10, 46, 28], center=true);
      translate([-5.5-10+1.5, -10, 30+23]) rotate([0, -45, 0]) cube([10, 46, 28], center=true);
      translate([-5.5-10+1.5, -10, 30-23]) rotate([0, +45, 0]) cube([10, 46, 28], center=true);
      translate([-5.5-10+1.5, -10, 30-23]) rotate([0, -45, 0]) cube([10, 46, 28], center=true);
    }
  }

  // Bottom pushfit rod
  translate([-15, -41.5, 6]) rotate([-90, 0, 0]) pushfit_rod(8.1, 50);

  // Top pushfit rod
  translate([-15, -41.5, rod_distance+6]) rotate([-90, 0, 0]) pushfit_rod(8.1, 50);
}

module pushfit_rod(diameter,length)
{
  poly_cylinder(h=length, r=diameter/2);
  difference() {
    translate([0, -diameter/2.85, length/2]) rotate([0,0,45]) cube([diameter/2, diameter/2, length], center=true);
    translate([0, -diameter/4-diameter/2-0.4, length/2]) rotate([0,0,0]) cube([diameter, diameter/2, length], center=true);
  }
}

// Final prototype
module x_end_plain()
{
  difference() {
    x_end_base();
    x_end_holes();
  }
}

x_end_plain();
