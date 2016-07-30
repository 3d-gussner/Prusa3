difference() {
    cylinder(d=20, h=30, $fn=50);
    translate([0,0,-1]) cylinder(d=20-2, h=30+2, $fn=50);
}
