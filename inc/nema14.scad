// Increase this if your slicer or printer make holes too tight.
extra_radius=0.1;

// Major diameter of metric 3mm thread.
m3_radius=2.85/2 + extra_radius;

// Placement for the NEMA14 stepper motors.
motor_length=33.9;

module nema14() {

  difference() {

    union() {

      // House
      translate([0, 0, -motor_length / 2]) intersection() {
        cube(size=[35, 35, motor_length], center=true);
        cylinder(r=23.5, h=motor_length + 1, center=true, $fn=60);
      }

      // Top circle
      cylinder(r=22/2, h=1.9, center=true, $fn=32);

      // Rod
      translate([0,0,-1]) cylinder(r=2.5, h=53.9-motor_length+1, center=false, $fn=24);

      // Plug
      translate([-(35/2)-(6.2/2)+1, 0, -motor_length+(10.2/2)]) cube(size=[6.2+(1*2), 16.3, 10.2], center=true);
    }

    // Holes for bolts
    for (a=[0:90:359]) {
      rotate([0, 0, a]) translate([26/2, 26/2, 0])
        cylinder(r=m3_radius, h=10, center=true, $fn=12);
    }

  }

}

nema14();
