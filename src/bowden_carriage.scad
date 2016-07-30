$fn=40;

% translate([0,0,-2.4]) import("Bowden_carriage.stl", convexity=3);

minkowski() {
  cube([37,37,5], center=true);
  cylinder(d=8, h=1);
}

translate([0,1.5,18.85]) minkowski() {
  cube([33,7,32], center=true);
  cylinder(d=5, h=1);
}
