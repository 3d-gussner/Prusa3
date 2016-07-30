$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

module y_frame()
{
  difference() {
    // Top plate
    hull() for (j=[-1,1]) for (i=[-1,1]) translate([j*i*211/2,i*-211/2]) circle(d=10, center=true);

    // Bolts
    for (i=[-1,1]) for (j=[-1,1]) translate([j*i*211/2,i*-211/2]) circle(d=3.2, center=true);
    for (i=[1,-1]) translate([0,i*20]) circle(d=3.2, h=1, center=true);
    for (i=[1,-1]) for (j=[1,-1]) translate([i*85.25,j*34.5]) {
      for(i=[1,-1]) translate([i*10,-0.5]) circle(d=3.2, h=1, center=true);
    }

    // Cutouts
    for (j=[-1,1]) for (i=[-1,0,1]) translate([i*65,j*70]) circle(d=50, center=true);
    for (i=[-1,1]) hull() {
      translate([i*40,0]) circle(d=50, center=true);
      translate([i*70,0]) circle(d=50, center=true);
    }
  }
}

y_frame();
