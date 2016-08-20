// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// Camera: -14,-5,33,247,0,323,231

use <../inc/x-end.scad>

module x_end_idler()
{
  mirror([0,1,0]) difference() {
    union() {
       x_end_base();
       translate([-15,10,58/2]) cube([17,10,58], center=true);
    }

    x_end_holes();
    for(i=[0,1]) translate([-15,-41.5+45,(i*45)+6]) {
        rotate([-90,0,0]) cylinder(d=3, h=20, $fn=20);
        translate([-5,8,0]) cube([10+(5.5+.2),2.4+.2,5.5+.4], center=true);
    }
  }
}

x_end_idler();

use <x-end-idler-tensioner.scad>
% translate([-15,-12.7-4.5,30]) rotate([0,90,90]) tensioner_plate();
% translate([-15,20-4.5,25]) rotate([0,0,-90]) tensioner_arm(length=50);
