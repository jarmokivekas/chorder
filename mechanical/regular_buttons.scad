$fa=0.2;
//use <key_model/Key_model.scad>;
use <proto_1/button_clips.scad>;

color("seagreen", 0.5)
union(){
	difference(){
		key_body_primitive();
		union(){
			button_clip_cavity();
			//translate([0,25,27]) rotate([90,0,0]) cylinder(h=50, r=20);
		}
	}
	button_clips();
}

module key_body_primitive(){
	polyhedron(
		points=[
			[ 9, 9, 0],	//lower points
			[ 9,-9, 0],
			[-9,-9, 0],
			[-9, 9, 0],
			
			[6.5, 4.5, 8],	//higher points
			[6.5, -8, 8],
			[-6.5, -8, 8],
			[-6.5, 4.5, 8]
		],
		triangles=[
			[1,0,2],	//bottom
			[3,2,0],
			[4,5,6],	//top
			[6,7,4],
	
			[0,5,4],	//east
			[0,1,5],
			[1,6,5],	//south
			[1,2,6],
			[2,7,6],	//west
			[2,3,7],
			[3,4,7],	//north
			[3,0,4]
		]
	);
}
