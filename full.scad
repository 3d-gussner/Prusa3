use <src/y-corners.scad>
use <src/y-motor.scad>
use <src/y-idler.scad>

use <src/x-end-idler.scad>
use <src/x-end-motor-nema14.scad>
use <src/z-axis-bottom-nema14.scad>
use <src/z-axis-top.scad>
use <inc/leadscrew_bolt.scad>


module y_axis_assembly() {
  for (i=[0,1]) mirror([0,i,0]) translate([0,-(380/2)+26,0]) {
    // 4x Threaded rod M8x210 mm
    % translate([-210/2,-11,10]) rotate([0,90,0]) cylinder(d=8, h=210);
    % translate([-210/2,-11,30]) rotate([0,90,0]) cylinder(d=8, h=210);
    // y-corners
    translate([+(210-30)/2,0,0]) y_corners();
    translate([-(210-30)/2,0,0]) y_corners();
  }
  for (i=[-1,1]) {
    // 2x Threaded rod M10x380 mm
    % translate([i*(210-30)/2,380/2,20]) rotate([90,90,0]) cylinder(d=10, h=380);
    // 2x Smooth rod Ø8x370 mm
    % translate([i*(210-30)/2,370/2,45]) rotate([90,90,0]) cylinder(d=8, h=370);
  }

  translate([0,-(380/2)+35,2]) rotate([0,0,180]) y_idler();
  translate([11,+(380/2)-15,0]) rotate([90,0,0]) rotate([0,-90,0]) y_motor();
}

// y_axis_assembly();

% translate([0,-60,-110]) cylinder(d=8, h=200);
% translate([0,60,-110]) cylinder(d=8, h=200);

# translate([0,38,-110]) cylinder(d=8, h=200, $fn=12);
# translate([0,-38,-110]) cylinder(d=8, h=200, $fn=12);

translate([29.3,-64.2, -80]) rotate([0,180,0]) z_axis_bottom();
translate([29.3,64.2, -80]) rotate([0,180,0]) mirror([0,1,0]) z_axis_bottom();

translate([0,-60,0]) rotate([0,180,0]) x_end_idler();
translate([0,60,0]) rotate([0,180,0]) x_end_motor();

translate([29.3,-64.2, 90]) rotate([0,180,0]) z_axis_top();
translate([29.3,64.2, 90]) rotate([0,180,0]) mirror([0,1,0]) z_axis_top();



% translate([0,38,-80-5]) rotate([0,0,0]) import("inc/nema14.stl", convexity=3);

// translate([0,38,5.3]) mirror([0,0,1]) color("white") leadscrew_bolt();


// % import("src/alu-frame.dxf", convexity=3);
// % import("src/FRAME10MM.dxf", convexity=3);
// % import("src/i3-plate.dxf", convexity=3);
// % import("src/Prusa3ALU-FREZOVANY-v4.dxf", convexity=3);
// % import("src/R14_vulkano_marco_prusai3.dxf", convexity=3);
// % import("src/R14_vulkano_marco_prusai3.dxf", convexity=3);

