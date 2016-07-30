$fn=50;

carriage_width=30;
carriage_height=28;
carriage_block_depth=5;

bearing_block_depth=7;

axis_bearing_dia=15.2;
axis_bearing_collar_dia=11;
axis_bearing_z=bearing_block_depth + carriage_block_depth - 1;
twin_bearing_length=24.5;
twin_bearing_offset=1;

tiewrap_depth=1.5;
tiewrap_inner_height=17;
tiewrap_bottom_offset=1;
tiewrap_radius=2.5;
tiewrap_width=4;

module y_frame_mount_block()
{
    difference() {
        union() {
            linear_extrude(10)
            hull() {
                translate([carriage_width/2-5, carriage_height/2 - 5, 0]) circle(r=5);
                translate([-carriage_width/2+5, carriage_height/2 - 5, 0]) circle(r=5);
                translate([carriage_width/2-5, -carriage_height/2 + 5, 0]) circle(r=5);
                translate([-carriage_width/2+5, -carriage_height/2 + 5, 0]) circle(r=5);
            }
        }
        union() {
            translate([0, 0, axis_bearing_z]) rotate([0,90,0]) cylinder(d=axis_bearing_dia, h=twin_bearing_length, center=true);
            for(i=[0,1]) mirror([i,0,0]) translate([(twin_bearing_length/2)-(tiewrap_width/2)-twin_bearing_offset, 0, 0]) y_frame_mount_tiewrap_cutout();

            translate([-(carriage_width / 2)-1, 0, axis_bearing_z]) rotate([0,90,0]) cylinder(d=axis_bearing_collar_dia, h=carriage_width+2);
        }
        for(i=[-1,1]) translate([0,i*10,10/2]) cylinder(d=3.2, h=10+2, center=true);
    }
}

module y_frame_mount_tiewrap_cutout()
{
    total_depth=carriage_block_depth + bearing_block_depth;

    difference() {
        translate([0,0,total_depth / 2]) cube([tiewrap_width, tiewrap_inner_height+tiewrap_depth*2, total_depth+2], center=true);
        translate([1,0,tiewrap_bottom_offset]) rotate([0, -90, 0]) minkowski() {
            translate([total_depth / 2 + tiewrap_radius, 0, -1]) cube([total_depth, tiewrap_inner_height - tiewrap_radius * 2, tiewrap_width - 2], center=true);
            cylinder(r=tiewrap_radius, h=4);
        }
    }
}

module y_frame_mount()
{
    for(i=[-1,1]) translate([0, i*34, 0]) rotate([0,0,90]) y_frame_mount_block();
    translate([0,0,3/2]) cube([10,40,3], center=true);
}

y_frame_mount();
