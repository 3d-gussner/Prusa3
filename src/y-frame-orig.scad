// Camera: 0,0,0,0,0,0,600
$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

module y_frame_orig()
{
  difference() {
    union() {
      square([180,170], center=true);
      for (i=[0,1]) for (j=[-1,1]) {
         mirror([i,0]) translate([-93,j*34]) polygon([[-7,-19],[-7,19],[3,29],[9,29],[9,-29],[3,-29] ]);
      }

      for (j=[-1,1]) difference() {
        hull() for (i=[-1,1]) translate([j*i*211/2,i*-211/2]) circle(d=10, center=true);
        for (i=[-1,1]) translate([j*i*211/2,i*-211/2]) circle(d=3.2, center=true);
      }
    }

    // Cutouts
    for (i=[0,1]) mirror([0,i]) polygon([[-28,35],[-68,75],[68,75],[28,35]]);
    for (i=[-1,1]) translate([i*50,0]) polygon([[-26,-15],[-26,15],[-10,30],[10,30],[26,15],[26,-15],[10,-30],[-10,-30]]);

    // Screw holes
    for (i=[1,-1]) translate([0,i*20]) circle(d=3.2, h=1, center=true);
    for (i=[1,-1]) for (j=[1,-1]) translate([i*85.25,j*34.5]) {
      for(i=[1,-1]) translate([i*10,-0.5]) circle(d=3.2, h=1, center=true);
    }
  }
}

y_frame_orig();

