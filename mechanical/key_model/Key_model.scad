$fs = 0.5;

key();

module key(){
	color("MediumSeaGreen"){
		key_body();
		middle_tube();
		pin();
		clips();
	}
}

module clips(){
	intersection(){
		union(){
			translate([-2.5,6.5,0]) clip();
			translate([2.5,-6.5,0]) rotate([0,0,180]) clip();	
		}
		bounds();
	}
}

module clip(){
	translate([-1.5,0,-6.5])
	union(){
		cube([3,1,12]);
		difference(){
			cube([3,2,1.5]);
			translate([-1,1,0]) rotate([-30,0,0]) cube([5,4,4]);
		}
	}
}

module pin(){
	intersection(){
		translate([6,-6,-6.5]) cylinder(h=14, r=1);	
		bounds();
	}
}

module middle_tube(){
	intersection(){
		difference(){
			translate([0,0,-6.5]) cylinder(h=15, r=3.5);
			translate([0,0,-7]) cylinder(h=3.5, r=2.75);
			translate([-1.5,-5, -7]) cube([3,5,3]);
		}
		bounds();
	}
}

module key_body(){
	difference(){
		key_body_primitive();
		translate([0,0,-0.1]) scale([0.9, 0.9, 0.9]) key_body_primitive();
	}
}

module bounds(){
	union(){
		key_body_primitive();
		translate([-9,-9,-20]) cube([18,18,20]);
	}
}

module key_body_primitive(){
	polyhedron(
		points=[
			[ 9, 9, 0],	//lower points
			[ 9,-9, 0],
			[-9,-9, 0],
			[-9, 9, 0],
			
			[6.5, 4.5, 9],	//higher points
			[6.5, -8, 6],
			[-6.5, -8, 6],
			[-6.5, 4.5, 9]
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
			[3,0,4],
		]
	);
}
