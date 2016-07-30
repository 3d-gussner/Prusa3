$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

module e3d_v6_hotend()
{
  rotate([-90,0,0]) translate([-4,10.4,-15]) import("V6.6_Duct.stl");
  translate([-20.75,0,-10.4]) rotate([90,0,90]) minkowski() {
    cube([30-6,30-6,10.5], center=true);
    cylinder(r=3, h=1, center=true);
  }
  rotate([90,0,90]) import("E3D_V6_3.00mm_Direct_HotEnd_Mockup.stl");
}

e3d_v6_hotend();
