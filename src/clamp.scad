rotate([90,0,0])
translate([0,15/2,0]) difference() {
  union() {
    cube([35,15,9+(5*2)], center=true);
    translate([0,-5,0]) cube([15,5,9+(5*2)+(3*2)], center=true);
  }
  translate([0,5,0]) cube([35+2,15,9.1], center=true);
  for (i=[-1,1]) {
    translate([i*11.2,2.5,0]) cylinder(d=3, h=25, $fn=20, center=true);
    translate([0,2.5,i*8]) rotate([90,0,0]) cylinder(d=3, h=25, $fn=20, center=true);
  }
  translate([0,5,0]) cube([10,5+10,9+(5*2)+2], center=true);
}