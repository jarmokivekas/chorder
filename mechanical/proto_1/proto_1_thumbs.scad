use <button_clips.scad>;

thumbs();

module thumbs(){
	union(){
		difference(){
			translate([0,0,1]);
			thumb_bodies();
			all_thumb_clip_cavities();
		}
		all_thumb_clips();
	}
}


module thumb_bodies(){
	intersection(){
		linear_extrude(height=10) import("proto_1_thumb_shadows.dxf");
		translate([-5, 18, -20]) rotate([0,90,0]) cylinder(h= 60, r = 30);
	}
}

module all_thumb_clips(){
	translate([6.5,16.5,0]) button_clips();
	translate([6.5+17.5,16.5,0]) button_clips();
	translate([6.5+35,16.5,0]) button_clips();
}

module all_thumb_clip_cavities(){
	translate([6.5,16.5,0]) button_clip_cavity();
	translate([6.5+17.5,16.5,0]) button_clip_cavity();
	translate([6.5+35,16.5,0]) button_clip_cavity();
}
