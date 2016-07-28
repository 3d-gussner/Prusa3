$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

use <../src/z-axis-bottom-nema14.scad>;

% translate([8,49.8,0]) rotate([0,0,-90]) mirror([0,0,1]) difference(){
  z_bottom_base();
  z_bottom_fancy();
  z_bottom_holes();
}

import("Z_endstop_holder.stl");
