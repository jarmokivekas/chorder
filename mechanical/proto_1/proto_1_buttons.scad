use <button_clips.scad>;
//button_clips()
//button_clip_cavity()

import("proto_1_body.stl");
translate([10.9,10.9,0])
rotate([90,0,-45])
color("blue", 0.5) buttons();

module buttons(){
	union(){
		difference(){
			translate([0,0,1])
			button_bodies();
			all_button_clip_cavities();
		}
		all_button_clips();
	}
}

module button_bodies(){
	intersection(){
		linear_extrude(height=10)
			import("button_shadows.dxf");
		translate([0,0,-15.9])
		rotate([-90,0,0])
			cylinder(h=120, r= /*22.5*/ 24);
	}
}

module all_button_clips(){
	translate([0,12.5,0]) button_clips();
	translate([0,35,0]) button_clips();
	translate([0,57.5,0]) button_clips();
	translate([0,80,0]) button_clips();
}

module all_button_clip_cavities(){
	translate([0,12.5,0]) button_clip_cavity();
	translate([0,35,0]) button_clip_cavity();
	translate([0,57.5,0]) button_clip_cavity();
	translate([0,80,0]) button_clip_cavity();
}
