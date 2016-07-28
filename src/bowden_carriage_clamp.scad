$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

difference() {
    union() {
        minkowski() {
            cube([33,7,10.7], center=true);
            cylinder(d=5, h=1);
        }
        translate([0,-4.3,.5]) cube([52,3.55,11.7], center=true);
    }

    translate([0,0,6.5]) rotate([90,0,0]) cylinder(d=12, h=15, center=true);
    for (i=[4.5,-5.5]) translate([0,i,6.5]) rotate([90,0,0]) cylinder(d=16, h=5, center=true);
    for (i=[-1,1]) {
        translate([i*13,0,0]) {
            cylinder(d=4.2, h=15, center=true);
            translate([0,0,-6]) cylinder(d=7.3, h=8, center=true);
            translate([0,0,-1.1]) cylinder(d1=7.3, d2=3, h=2, center=true);
        }
        translate([i*22,-5,2.3]) rotate([90,0,0]) cylinder(d=3, h=15, center=true);
    }
}
