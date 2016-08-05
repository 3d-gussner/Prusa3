module filament_holder()
{
  width=10;
  height=8;
  gap=6;
  offset=10;

  difference() {
    hull() {
      translate([-5,(height/2)+2]) circle(d=5, center=true, $fn=20);
      #translate([(width/2)-(5/2)-7.5-offset,(height/2)+2+offset]) circle(d=5, center=true, $fn=20);
      translate([(width/2)-(3/2),0]) circle(d=3, center=true, $fn=20);
      translate([-(width/2)+(3/2),0]) circle(d=3, center=true, $fn=20);
    }
    translate([-5-offset,(height/2)+2+offset]) circle(d=3, center=true, $fn=20);
    translate([-2,2]) circle(d=3, center=true, $fn=20);
  }

  difference() {
    translate([0,-height/2]) square([width,height], center=true);
    translate([0,-(height/2)-2]) square([gap,height], center=true);
  }
}

filament_holder();
