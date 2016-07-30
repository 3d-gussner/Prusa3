$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

outer_diameter=10;

difference() {
  offset=1.5;
  union() {
    cube([12.6,16.5,4], center=true);
    translate([0,0,3.8]) cube([12.6+1,16.5+1,4], center=true);
    translate([0,offset,8]) cylinder(d=outer_diameter+2, h=8, center=true);
  }
  translate([0,offset,0]) cylinder(d1=12, d2=outer_diameter-2, h=8, center=true);
  translate([0,offset,5]) cylinder(d1=outer_diameter-2, d2=outer_diameter, h=20, center=true);
  for(i=[-1,1]) translate([i*4.4,-6.4,5]) cylinder(d=1.5, h=5, center=true);
}

* union() {
  difference() {
    union() {
      hull() {
        cylinder(5, d=11.5+2.4, center=true);
        for(i=[-1,1]) translate([i*4.5,-8,0]) cylinder(5,d=2+2.4,center=true);
      }
      translate([0,0,5]) cylinder(d=outer_diameter+2, h=8, center=true);
    }

    for(i=[-1,1]) translate([i*3.5,-8,2]) cylinder(5+1,d=1.5,center=true);
    translate([0,0,3]) cylinder(d1=outer_diameter-2, d2=outer_diameter, h=20, center=true);
    cylinder(d1=12, d2=outer_diameter-2, h=8, center=true);
  }
}
