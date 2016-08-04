// $fa=0.5; // default minimum facet angle is now 0.5
// $fs=0.5; // default minimum facet size is now 0.5 mm

module z_endstop_holder()
{
  difference() {
    union() {
      for (i=[0,1]) hull() for (j=[-5,13.2]) translate([16.3+(i*26),j,4/2]) cylinder(d=10, h=4, center=true);
      translate([29.3,-5,20/2]) cube([36,10,20], center=true);
      translate([23.3,-10.5,5.5]) cube([20,1,11], center=true);
    }
    # for (i=[0,1]) translate([16.3+(i*26),13.2,4/2]) cylinder(d=3, h=6, center=true, $fn=10);
    translate([29.3,4,12/2]) cylinder(d=12, h=30, center=true);
    # for (i=[-1,1]) translate([29.3-6+(i*(9.7/2)),-5,14]) rotate([90,0,0]) cylinder(d=3, h=20, center=true, $fn=10);
    translate([23.3,0,14]) cube([10,3,3], center=true);
    translate([11+36.5-4+3.5,-5,15-3.5]) rotate([0,-45,0]) cube([10,20,20], center=true);
    translate([46.4,-5,25]) cube([20,20,20], center=true);
  }
}

module switch()
{
    difference() {
        cube([20, 6.4, 10.5], center=true);
        for (i=[-1,1]) {
            rotate([90,0,0]) translate([i*((20/2)-5),-(10.5/2)+3,0]) cylinder(d=2.5, h=6.4+20, $fn=10, center=true);
        }
    }
}

// use <z-axis-bottom-nema14.scad>
// % mirror([0,0,1]) z_axis_bottom();

z_endstop_holder();
% translate([23.3, -13.3, 16.3]) switch();
