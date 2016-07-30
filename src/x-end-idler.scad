// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <x-end.scad>

module x_end_idler()
{
    mirror([0,1,0]) difference() {
        x_end_base();
        x_end_holes();
    }
}

x_end_idler();

use <x-end-idler-tensioner.scad>
% translate([-15,-12.7,30]) rotate([0,90,90]) tensioner_plate();
% translate([-15,20,25]) rotate([0,0,-90]) tensioner_arm(length=50);
