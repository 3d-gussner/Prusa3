module hotend_platform()
{
  difference() {
    union() {
      translate([0,0,-6.25]) cube([52,5,51.5], center=true);
      rotate([90,0,0]) {
        for (j=[0,1]) hull() for (i=[0,1]) {
          translate([(i*10)+13,-((j*25.5)+3),-3.5]) cylinder(d=3, h=3, center=true, $fn=10);
        }
      }
      rotate([0,90,0]) {
        translate([-14,1,-23.5]) hull() {
          cube([11,1,5], center=true);
          translate([0,4,0]) cylinder(d=9, h=5, center=true);
        }
      }
    }
    translate([0,0,-23]) cube([20,6,21], center=true);
    translate([0,0,-33]) cube([33,6,5], center=true);
    rotate([90,0,0]) {
      cylinder(d1=22, d2=15, h=10, center=true, $fn=40);
      for(i=[-1,1]) translate([i*22,3.9,0]) {
        cylinder(d=3, h=10, center=true, $fn=10);
        translate([0,0,-5+3.3]) cylinder(d=6, h=5, center=true, $fn=16);
      }
      # for (i=[0,1]) translate([18,-((i*25.5)+3),0]) cylinder(d=1, h=12, center=true);
    }
    #rotate([0,90,0]) translate([-14,5,-24.5]) cylinder(d=3, h=10, center=true, $fn=10);
  }
}

rotate([90,0,0]) {
  // % translate([0,-10.2,-39]) {
  //     import("../distribution/bowden_carriage.stl", convexity=3);
  //     translate([0,1.5,45.2]) rotate([180,0,0]) import("../distribution/bowden_carriage_clamp.stl", convexity=3);
  //     translate([0,-13.4,39]) rotate([-90,180,0]) import("../inc/e3d_v6_hotend.stl", convexity=3);
  // }
  hotend_platform();
}
