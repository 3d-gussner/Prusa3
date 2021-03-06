// Camera: 2,-4,8,38,0,238,170

module round_box(size=[1,1,1], d=0.1, center=false)
{
  minkowski() {
    cube(size-[d,d,0], center=center);
    cylinder(d=d, h=0.01, center=center, $fn=24);
  }
}

module bearing_624()
{
  difference() {
    cylinder(d=13, h=5, center=true, $fn=48);
    cylinder(d=4, h=5.1, center=true, $fn=24);
  }
}

module tensioner_arm(length)
{
  translate([length/2,0,10/2]) rotate([0,0,90]) {
    difference() {
      union() {
        for (i=[0,1]) mirror([i,0,0]) {
          translate([3.4,length-5,0]) rotate([0,90,0]) cylinder(d=10, h=4, center=true, $fn=30);
          translate([3.4,(length-5)/2,0]) cube([2,length-5,10], center=true);
          translate([4.4,(length-10),0]) cube([2,10,10], center=true);
        }

        translate([0,8/2,8.8/2]) cube([8.8,8,10+8.8], center=true);
        translate([0,length-20+(3/2),0]) cube([8,3,10], center=true);
      }

      #for (i=[0,1]) translate([0,10,i*8]) rotate([90,0,0]) cylinder(d=3.2, h=20, $fn=10);
      translate([0,length-5,0]) rotate([0,90,0]) cylinder(d=3.3, h=15, center=true, $fn=10);
      translate([0,4,-5/2]) cube([6, 2.1, 5+6], center=true);
      for (i=[0,1]) mirror([i,0,0]) translate([9.2/2,4,27.7/2]) rotate([0,45,0]) cube([6,10,4.2], center=true);
      translate([0,length-5,0]) rotate([0,90,0]) {
        difference() {
          cylinder(d=10+8, h=6.9, center=true, $fn=30);
          cylinder(d=10-3, h=6.9, center=true, $fn=30);
        }
        cylinder(d=10+4, h=5.4, center=true, $fn=30);
      }
    }

    // Show where the 624 bearing goes
    translate([0,length-5,0]) rotate([0,90,0]) {
      % bearing_624();
    }
  }
}

module tensioner_plate()
{
  difference() {
    union() {
      translate([0,0,2/2]) round_box([27.7, 5+3, 2]+[4,6,0], d=5, center=true);
      translate([0,0,(3/2)+1]) difference() {
        cube([27.7, 8.8, 3], center=true);
        for (i=[0,1]) mirror([0,i,0]) for (j=[0,1]) mirror([j,0,0]) translate([27.7/2,9.2/2,0]) rotate([0,0,45]) cube([4.2,10,5], center=true);
      }
    }
    # for(i=[0,-1]) translate([i*8,0,-3]) rotate([0,0,90]) cylinder(d=3.2, h=10, $fn=10);
  }
}

translate([0,-10,0]) tensioner_arm(length=55);
translate([0,10,0]) tensioner_plate();
