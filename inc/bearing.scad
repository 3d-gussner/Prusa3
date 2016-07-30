// PRUSA iteration3
// Bearing holders
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <polyholes.scad>

bearing_diameter=15;

module horizontal_bearing_base(bearings=1)
{
  translate([0,0,6]) cube(size=[24,8+bearings*25,12], center=true);
}

module horizontal_bearing_holes(bearings=1)
{
  cutter_lenght=10+bearings*25;
  one_holder_lenght=8+25;
  holder_lenght=8+bearings*25;

  // Main bearing cut
  difference() {
    translate([0,0,12]) rotate([90,0,0]) translate([0,0,-cutter_lenght/2]) cylinder(h=cutter_lenght, r=bearing_diameter/2, $fn=50);
    // Bearing retainers
    translate([0,1-holder_lenght/2,3]) cube(size=[24,6,8], center=true);
    translate([0,-1+holder_lenght/2,3]) cube(size=[24,6,8], center=true);
  }

  // Ziptie cutouts
  ziptie_cut_ofset=0;
  for ( i=[0 : bearings-1] ) {
    // For easier positioning I move them by half of one
    // bearing holder then add each bearign lenght and then center again
    translate([0,-holder_lenght/2,0]) translate([0,one_holder_lenght/2+i*25,0]) difference() {
      union() {
        translate([0,2-6,12]) rotate([90,0,0]) translate([0,0,0]) cylinder(h=4, r=12.5, $fn=50);
        translate([0,2+6,12]) rotate([90,0,0]) translate([0,0,0]) cylinder(h=4, r=12.5, $fn=50);
      }
      translate([0,10,12]) rotate([90,0,0]) translate([0,0,0]) cylinder(h=24, r=10, $fn=50);
    }
  }
}

module horizontal_bearing_test()
{
  difference() {
    horizontal_bearing_base(1);
    horizontal_bearing_holes(1);
  }

  translate([30,0,0]) difference() {
    horizontal_bearing_base(2);
    horizontal_bearing_holes(2);
  }

  translate([60,0,0]) difference() {
    horizontal_bearing_base(3);
    horizontal_bearing_holes(3);
  }
}



thinwall=3;
bearing_size=bearing_diameter + 2 * thinwall;

module vertical_bearing_base()
{
  translate([-2-bearing_size/4,0,29]) cube(size=[4+bearing_size/2,bearing_size,58], center=true);
  cylinder(h=58, r=bearing_size/2, $fn=90);
  translate([(bearing_size/2)+2,0,29]) cube([10,12,58], center=true);
}

module vertical_bearing_holes()
{
  height=58;
  translate([0,0,-1]) poly_cylinder(h=height+2, r=bearing_diameter/2);
  translate([bearing_diameter/2-1,-4/2,-1]) cube(size=[(thinwall*2)+8,4,62]);
  rotate([90,0,0]) translate([14,13,0]) cylinder(d=3, h=15, center=true, $fn=20);
  rotate([90,0,0]) translate([14,height-13,0]) cylinder(d=3, h=15, center=true, $fn=20);
}

difference() {
  vertical_bearing_base();
  vertical_bearing_holes();
}
