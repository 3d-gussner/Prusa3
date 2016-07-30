// $fa=0.5; // default minimum facet angle is now 0.5
// $fs=0.5; // default minimum facet size is now 0.5 mm

% translate([0,0,19]) import("../inc/nema17.stl", convexity=3);

difference() {
  union() {
    translate([0,0,30/2]) cube([47,47,30], center=true);
    translate([0, (47/2)-(1.0/2), 30/2]) cube([47+17,2.5,30], center=true);
    for (i=[0,1]) mirror([i,0,0]) hull() {
      translate([(52/2),(47/2)-(1/2),30/2]) cube([8,1,1], center=true);
      translate([(47/2)-(1/2),(47/2)-(20/2),30/2]) cube([1,20,1], center=true);
    }
  }
  translate([0,0,(40/2)+2]) cube([47-4,47-4,40], center=true);
  translate([22,0,4]) cube([4,10,4], center=true);
  translate([0,0,1]) cylinder(d=30, h=3, center=true);
  # for(i=[-1,1]) for(j=[-1,1]) translate([i*(52/2)-1, (47/2)-(2/2), (30/2)+8*j]) rotate([90,0,0]) cylinder(d=3.2, h=4, center=true);
  # for (a=[0:90:359]) rotate([0,0,a]) translate([15.5,15.5,0]) cylinder(d=3.2, h=5, center=true);
  for(i=[0,1]) mirror([i,0,0]) for(i=[-1,1]) translate([(52/2)+(14/2),(47/2),(30/2)-(30/2*i)]) rotate([0,i*45,0]) cube([8,6,20], center=true);
  translate([0,-47/2,33]) rotate([30,0,0]) cube([47+10,60,40], center=true);
}
