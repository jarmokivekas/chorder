$fs=1;

difference(){
	body();
	screwholes();
	buttonholes();
}
//buttonholes();

module body(){
	difference(){
		linear_extrude(height=120) import(file="proto_1_body.dxf");
		translate([-25, 25, 133]) rotate([0,45,-45]) cube([150,90,100]);
	}
}

module skrewholes(){
	translate([27.5,0,5]) screwhole();
	translate([27.5,0,70]) screwhole();
	translate([67.5,0,5]) screwhole();
	translate([67.5,0,40]) screwhole();
}

module screwhole(){
	union(){
		rotate([-90,0,0]) translate([0,0,-1]) cylinder(h=7, r=2);
		rotate([-90,0,0]) translate([0,0,2.5]) cylinder(h=3.5, r=3);
	}
}

module buttonholes(){
	translate([12,12,12.5]) buttonhole();
	translate([12,12,35]) buttonhole();
	translate([12,12,57.5]) buttonhole();
	translate([12,12,80]) buttonhole();
}

module buttonhole(){
	rotate([0,0,45]) cube(size=[7,13,13], center=true);
}
