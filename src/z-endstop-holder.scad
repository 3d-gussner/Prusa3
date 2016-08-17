// Camera: 28,7,6,68,0,206,188
// Name: Z Endstop Holder
// Desc: Sits on the z-axis-bottom and holds an Opto Endstop Switch

module z_endstop_holder()
{
  difference() {
    union() {
      for (i=[0,1]) hull() for (j=[-5,13.2]) translate([16.3+(i*26),j,4/2]) cylinder(d=10, h=4, center=true);
      translate([29.3,-5,20/2]) cube([36,10,20], center=true);
    }
    # for (i=[0,1]) translate([16.3+(i*26),13.2,4/2]) cylinder(d=3, h=6, center=true, $fn=10);
    translate([29.3,4,12/2]) cylinder(d=12, h=30, center=true);
    for (i=[0,19]) translate([29.3-6.15+i, -7, 14.2]) {
      rotate([90,0,0]) cylinder(d=3, h=25, center=true, $fn=10);
      translate([0,10,0]) rotate([90,30,0]) cylinder(d=7.1, h=14, center=true, $fn=6);
    }
    translate([9,-5,18]) cube([20,20,20], center=true);
  }
}

z_endstop_holder();

use <../inc/opto-endstop.scad>
% translate ([12,-11,9]) mirror([0,1,0]) opto_endstop();

use <z-axis-bottom.scad>
% mirror([0,0,1]) z_axis_bottom();
% translate([29.3,4.2,-10]) cylinder(d=8, h=60, $fn=20);
