$fs=0.5;

color("darkorange",0.5) button_dock();
color("springgreen") button_clips();
color("red",0.5) button_clip_cavity();

//dock measurements
top_height = 1.8;
shaft_height = 1.4;
dock_height = top_height + shaft_height;
hole_radius = 0.8;
hole_depth = 1;
base_radius = 3.5;
module button_dock(){
	difference(){
		union(){
			translate([-2,-2,shaft_height])
				cube([4,4,top_height]);
			translate([-1.5,-1.5,0])
				cube([3,3,dock_height]);
			translate([0,0,-2])
				cylinder(h=2, r=base_radius);
		}
		translate([0,0,dock_height-hole_depth+0.1]) 
			cylinder(h=hole_depth, r=hole_radius);
	}
}

clip_width = 2;
clip_thick = 1.5;
clip_height = 7;
module button_clip(){
	translate([-(2+clip_thick),clip_width/2,0])
	rotate([90,0,0])
	union(){
		cube([clip_thick ,clip_height, clip_width]);
		linear_extrude(height=clip_width)
		polygon(
			points=[
				[0,0],
				[0,shaft_height],
				[clip_thick+0.5, shaft_height],
				[clip_thick,0]
			],
			paths=[
				[0,1,2,3]
			]
		);
	}
}

module middle_pin(){
	translate([-1,-1,dock_height+0.2]) cube([2,2,clip_height-dock_height-0.2]);
	translate([0,0,dock_height-hole_depth+0.2]) cylinder(h=hole_depth+0.2, r=hole_radius-0.1);
}

module button_clips(){
	rotate([0,0,0]) button_clip();
	rotate([0,0,90]) button_clip();
	rotate([0,0,180]) button_clip();
	rotate([0,0,270]) button_clip();
	middle_pin();
}

module button_clip_cavity(){
	translate([0,0,-1]) cylinder(h=clip_height, r=4);
}
