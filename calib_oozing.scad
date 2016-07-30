for(a=[0:30:360]) {
  translate([sin(a)*50,cos(a)*50,0]) {
    difference() {
      cylinder(d=5, h=3, $fn=10);
      translate([0,0, -4]) cylinder(d=3, h=10, $fn=10);
    }
  }
}
