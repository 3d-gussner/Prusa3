$fs=0.5;

module leadscrew_bolt()
{
    difference() {
        union() {
            cylinder(d=10.15, h=15.25);
            translate([0,0,15.25-10-3.8]) cylinder(d=22, h=3.8);
        }
        translate([0,0,-2]) cylinder(d=6.75, h=20);
        for (a=[0:90:359]) {
            rotate([0,0,a]) translate([(22/2)-(3.5/2)-1.2,0,-2]) cylinder(d=3.5, h=20);
        }
    }
}
leadscrew_bolt();