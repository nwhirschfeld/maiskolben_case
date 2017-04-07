 
include <control_elements.scad>;
include <shell.scad>;


pad = 0.1; // Padding to maintain manifold
smooth = 120; // Number of facets of rounding cylinder
l = 150;
h = 100;

difference(){
	// create the outer shell
	difference(){
		// outer shell form
		shell(l,h,80,15);
		difference(){
			translate([0,-3,-0.1])
			 shell(l-6,h-4,74,15);
			// this block is to make the bottom hole less fragile
			translate([0,-110,2])
			 cube(size = [100,20,4], center = true);
		}
	}

	// all the things we have to remove from the shell
	union(){
		// placing control elements
		translate([0,-70,63])
		 rotate(a=[atan(h/l),0,0])
		  control_elements(-5);
		// placing the soldering iron headphone connector thing
		translate([40,-100,15])
		 rotate([0,90,0])
		  cylinder(20,2.8,2.8,center=true,$fn=smooth);
        
        translate([22,-10,20])
            cube(size = [9,30,11], center = true);
	}
}

// place the holding blocks for the bottom plate
translate([0,-7,0])
 for ( x = [-1, 1]) {
	for ( y = [0, 1]) {
		translate([x*33,y*-80,8])
		 difference(){
			cube(size = [8,8,10], center = true);
			cylinder(30,1,1,center=true,$fn=smooth);
		}
	}
}


