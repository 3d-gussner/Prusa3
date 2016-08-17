// PRUSA iteration3
// Z axis top holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// Camera: 5,-5,-3,56,0,115,317

module z_top_base()
{
  // plate touching the base
  translate([0, -5, 0]) {
    cube([42, 45, 6.9]);
    cube([8, 45, 16]);
    cube([30, 5.01, 12]);
  }
}

module z_top_fancy()
{
  // Corner cutouts
  translate([0.5,0.5,-2]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([0.5,40-0.5,-2]) rotate([0,0,-45+90]) translate([-15,0,-1]) cube([30,30,51]);
  translate([38-2.5,-5+2.5,-2]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
  translate([58,58,-2]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([8,0,12]) rotate([0,-45,0]) translate([0,-5-2,0]) cube([30,50,30]);
  translate([0,0,5]) rotate([45+180,0,0]) rotate([0,0,-45+90]) translate([0,0,-15]) cube([30,30,30]);

  // Stiffner cut out
  translate([30,0,7]) rotate([0,-45,0]) translate([0,-5-2,0]) cube([30,50,30]);
}

module z_top_holes()
{
  // Screw holes
  translate([-1,10,10]) rotate([0,90,0]) cylinder(h=20, r=1.8, $fn=30);
  translate([-1,10+20,10]) rotate([0,90,0]) cylinder(h=20, r=1.8, $fn=30);

  // Screw heads
  translate([4,10,10]) rotate([0,90,0]) cylinder(h=20, r=3.1, $fn=30);
  translate([4,10-3.1,10]) cube([10,6.2,10]);
  translate([4,10+20,10]) rotate([0,90,0]) cylinder(h=20, r=3.1, $fn=30);
  translate([4,10+20-3.1,10]) cube([10,6.2,10]);

  // Ball bearing
  translate([25+4.3,26.2,-1]) cylinder(h=10, d=13, $fn=20);
  translate([25+4.3,26.2,1]) cylinder(h=10, d=22.5, $fn=30);
  translate([25+4.3-9.5, 26.2+9.5, -3]) cylinder(h=13, d=2.5, $fn=15);
  translate([25+4.3+5.5, 26.2-12.5, -3]) cylinder(h=13, d=2.5, $fn=15);

  // Z rod holder
  translate([25+4.3,4.2,-1]) cylinder(h=10, r=4.1, $fn=15);
}

module z_axis_top()
{
  difference() {
    z_top_base();
    z_top_fancy();
    z_top_holes();
  }
}

// Final part
module z_top()
{
  translate([0,10,0]) z_axis_top();
  mirror([0,1,0]) translate([0,10,0]) z_axis_top();
}

z_top();
