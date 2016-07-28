$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

//////////////////////////////////////////////////////////////////////////////////////
///
///  Yet another power supply cover!
///
///  It's for the inexpesive 360W 12V/30A powersupply offered on eBay for under $30.
///  It is designed for the following additional components:
///  - 1pc standard IEC320 C14 AC inlet power socket
///  - 1pc mini on-off rocker switch 3A 250V 15mmx11mm (KCD1)
///  - 1-3 pcs large Molex 2-pin power connectors
///
//////////////////////////////////////////////////////////////////////////////////////
///
///  2013-10-27 Heinz Spiess, Switzerland
///
///  released under Creative Commons - Attribution - Share Alike licence
//////////////////////////////////////////////////////////////////////////////////////

// power supply dimensions
psw = 113.5;// width fo power supply
psh = 49; // height of power supply
psd = 19; // depth inside power supply
psa = 2.0;// thickness of alu sheets
psb = 9;  // thickness of ps bottom

// molex female plug dimensions
mow = 15; // width of molex socket
moh = 8.5; // height of molex socket
moc = 1.5;   // extra height of clip
mod = 18;  // depth of molex in case
mox = 0;  // position of molex sockets
mon = 3;   // number of molex slots

// ac socket dimensions
act = 50;  // total width of ac socket
acw = 27;  // width of ac socket
ach = 20;  // height of ac socket
acs = 40;  // screw distance of ac socket
acc = 8;   // corner length

// ac switch
sww = 13.5;  // switch width
swh = 9;   // switch height

// lcd voltage display
vdw = 23; // width
vdh = 14.5; // height
vdd = 6;  // depth
vds = 28; // screw base

//
exd = 21; // extruding depth behind power supply
wall = 3; // wall thickness
m4 = 4.2;  // screw diameter
m3 = 3.2;  // screw diameter

module pscover(supports=true){
  difference(){
    union(){
      // man cover walls
      cube([psw,wall,psh]);
      cube([psw,exd,wall]);
      translate([psa,0,psh-wall])cube([psw-2*psa,psd+exd,wall]);

      // side walls
      for(x=[0,psw-wall])translate([x,0,0])cube([wall,exd,psh]);
      for(x=[psa,psw-wall-psa-1])translate([x,0,psb])cube([wall+1,exd+11.0,psh-psb]);
      for(x=[psa,psw-wall-psa-1])translate([x,0,psh-psb])cube([wall+1,exd+psd,psb]);

      // ac socket screw hubs
      translate([psw-wall-act/2,0,psh-1.5*wall-ach/2])
      for(x=[-acs/2,acs/2])translate([x,0,0])rotate(-90,[1,0,0])cylinder(r=5, wall+2);

      // molex frames
      for(n=[0:mon-1])
      translate([2*wall+mox-wall+n*(wall+mow),0,psh-4*wall-ach/2-moh/2])cube([mow+2*wall,mod,moh+2*wall]);

      // lcd display support
      for(x=[0,vds])
         translate([x+psw/4-vdw/2-(vds-vdw),0,psh-vdd])cube([vds-vdw,(exd+psd)/2+vdh/2,vdd]);
    }
      // molex cutouts
      for(n=[0:mon-1]){
        translate([2*wall+mox+n*(wall+mow),-1,psh-3*wall-ach/2-moh/2])cube([mow,mod+2,moh]);
        translate([2*wall+mox+n*(wall+mow)+mow/3,-1,psh-3*wall-ach/2+moh/2-1])cube([mow/3,mod+2,moc+1]);
        translate([2*wall+mox+n*(wall+mow)+mow/2-2,2*wall,psh-3*wall-ach/2-moh/2-1.5])cube([4,mod+2,moh+3]);
        translate([2*wall+mox+n*(wall+mow)+mow/2-2,2*wall,psh-3*wall-ach/2-moh/2-5])cube([4,5,moh+10]);
      }
      // ac socket cutout
      translate([psw-wall-act/2,0,psh-1.5*wall-ach/2]){
         for(x=[-acs/2,acs/2])translate([x,-1,0])rotate(-90,[1,0,0])cylinder(r=m3/2, wall+2);
         for(x=[-acs/2,acs/2])translate([x,wall,0])rotate(-90,[1,0,0])cylinder(r=5.5/2/cos(30), wall+2,$fn=6);
   hull(){
     translate([-acw/2,-1,-ach/2])cube([acw,wall+2,ach-acc/sqrt(2)]);
     translate([-acw/2+acc/sqrt(2),-1,+ach/2-0.1])cube([acw-sqrt(2)*acc,wall+2,0.1]);
   }
      }

      // lcd display cutout
      translate([psw/4-vdw/2,(exd+psd)/2-vdh/2,psh-wall-1])cube([vdw,vdh,wall+2]);

      // ac switch cutout
      translate([psw/2,(exd+psd)/2-swh/2,psh-wall-1])cube([sww,swh,wall+2]);
      hull(){
          translate([psw/2-2,(exd+psd)/2-swh/2-2,psh-wall-0.1])cube([sww+4,swh+4,0.2]);
          translate([psw/2-1,(exd+psd)/2-swh/2-1,psh-wall/2])cube([sww+2,swh+2,0.1]);
      }

      // cutout for screws
      translate([psw/2,exd+6.5,psh/2])for(s=[-1,1])scale([s,1,1])translate([psw/2-wall-psa-1,0,0])rotate(90,[0,1,0])cylinder(r=m3/2,h=wall+psa+2);
      translate([psw/2,exd+6.5,psh/2])for(s=[-1,1])scale([s,1,1])translate([psw/2-wall-psa-2,0,0])rotate(90,[0,1,0])cylinder(r=5.5/2/cos(30),h=psa+1,$fn=6);

      //  anti-warping grooves
      for(x = [8:20:psw-5]) translate([x,wall,wall/2])cube([1.5,exd-wall-2,wall]);
      for(x = [8,50,85,105]) translate([x,wall,psh-wall-1])cube([1.5,exd+psd-wall-2,wall/2+1]);
      for(x = [18:20:psw-5]) translate([x,wall/2,wall])cube([1.5,wall/2+1,psh-2*wall]);
  }

  //  explicit bridge support for lcd display cutout (cut away after printing)
  if(supports)color("red")for(x=[vdw/3-1,2*vdw/3-1])
         translate([x+psw/4-vdw/2,(exd+psd)/2-vdh/2,psh-wall])cube([2,vdh-0.25,wall]);

  // anti-warping disks

  if(supports)color("red")for(x=[0,psw])for(z=[0,psh])translate([x,0.01,z])rotate(-90,[1,0,0])cylinder(r=10,h=0.5);
}

//pscover(supports=false);
//translate([-100,0,0])rotate(90)pscover(supports=false);
//translate([90,140,30])rotate(180)pscover(supports=false);

//translate([0,-50,0])color("blue")rotate(90,[1,0,0]) pscover();
rotate(90,[1,0,0]) pscover(supports=true);



module power_supply() {
  difference() {
    union() {
      cube([110,60,50], center=true);
      translate([0,-(60/2)-(12.3/2),-(50/2)+(8.6/2)]) cube([110,12.3,8.6], center=true);
      translate([(110/2)-(1.6/2),-(60/2)-(12.3/2),0]) cube([1.6,12.3,50], center=true);
      translate([0,-(60/2)-(12/2),-(50/2)+(16.7/2)+8.7]) cube([87.5,12,16.7], center=true);
    }
    translate([-(110/2)+7.5,-42.3+5.1,-21]) cylinder(d=3, h=12, center=true);
    translate([(110/2)-6,-42.3+5.1,-(50/2)]) cylinder(d=4, h=4, center=true);
    translate([(110/2)-6.4,-42.3+5.1,-(50/2)+(10/2)+(1.6/2)]) cube([9.6,11,10], center=true);

    translate([(110/2)-(1.6/2),-42.3+6.4,(50/2)-6.4]) rotate([0,90,0]) cylinder(d=4, h=4, center=true);
    translate([(110/2)-(1.6/2),-42.3+6.4,(50/2)-6.4-10]) rotate([0,90,0]) cylinder(d=4, h=4, center=true);
  }
}

// translate([0,52.5,0]) power_supply();

// union() {
//   difference() {
//     cube([110,45,50], center=true);
//     // translate([0,4,0])
//     cube([110-(2*3),45+(2*2),50-(2*2)], center=true);
//     translate([27,-6,25]) union() {
//       for(i=[-1,1]) translate([i*20,0,-1]) cylinder(d=2, h=4*2, center=true);
//       cube([27.75,19.75,4*2], center=true);
//     }
//     translate([-17,-6-4,25]) cube([18.8,11.8,4*2], center=true);
//     translate([(110/2),(45/2)-(14/2)+1.8,0]) cube([3.2,14.2,50+2], center=true);
//     translate([0,(45/2)-((12.3-2)/2),-(50/2)+((8.6-2)/2)]) cube([110+2,12.3+2,8.6+2], center=true);
//     // translate([20,-20,0]) rotate([90,0,0]) cylinder(d=10, h=20); // REMOVE
//   }
//   difference() {
//     union() {
//       cube([2,45,50-2], center=true);
//       translate([-34,0,0]) cube([2,45,50-2], center=true);
//     }
//     rotate([-14,0,0]) translate([-17,30,0]) cube([60,40,100], center=true);
//     rotate([0,90,0]) translate([-10,-10,-18]) cylinder(d=10, h=60, center=true); // REMOVE
//   }
//   translate([-48,3.7,-20.4]) cube([10,13,8], center=true);
// }
