// $fa=0.5; // default minimum facet angle is now 0.5
// $fs=0.5; // default minimum facet size is now 0.5 mm

use <z-axis-bottom-nema14.scad>

% translate([29.3,21,-5.28]) rotate([0,0,180]) import("../inc/nema14.stl", convexity=3);
% mirror([0,0,1]) z_axis_bottom();

difference() {
    union() {
        for (i=[0,1]) hull() for (j=[-5,8]) translate([16.3+(i*26),j,4/2]) cylinder(d=10, h=4, center=true);
        translate([29.3,-5,12/2]) cube([36,10,12], center=true);
    }
    # for (i=[0,1]) translate([16.3+(i*26),8,4/2]) cylinder(d=3, h=6, center=true, $fn=10);
    translate([29.3,4,12/2]) cylinder(d=12, h=30, center=true);
    # for (i=[-1,1]) translate([29.3-6+(i*(9.7/2)),-5,6]) rotate([90,0,0]) cylinder(d=3, h=20, center=true, $fn=10);
    // translate([11,-5,15]) rotate([0,30,0]) cube([10,20,30], center=true);
    translate([11+36.5-4,-5,15]) rotate([0,-45,0]) cube([10,20,30], center=true);
}
