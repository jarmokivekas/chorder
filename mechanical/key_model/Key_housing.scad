$fs = 0.5;
color("lightgrey", 0.5) import("Key_model.stl");
color("yellow", 0.5) wood();
color("green", 0.5) PCB(); 

module wood(){
	translate([-20,-20,-3])
	difference(){
		cube([40,40,4]);
		translate([10.5,10.5,-0.5]) cube([19,19,5]);
	}
}

module PCB(){
	translate([0,0,-5])
	difference(){
		translate([-20,-20,0]) cube([40,40,2]);
		
		translate([6,-6,-0.5])cylinder(h=6, r=1.2);
		translate([0,0,-0.5])cylinder(h=6, r=3.7);
		translate([-2.5-2 ,4.5,-0.5]) cube([4,3,6]);
		translate([2.5-2,-7.5,-0.5]) cube([4,3,6]);
	}
}


