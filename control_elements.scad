module control_elements(i = 10){

	// settings (don't need to change, if you use the parts ordered by rabbit)
	button_radius = 4.5;
	button_horizontal_space = 9;
	button_vertical_space = 50;
	screen_width = 35;
	screen_hight = 28;

	// place the hole for the display
	cube(size = [screen_width,screen_hight,20], center = true);
	// and make some cool corners
	translate([0, 0, i+8])
	 minkowski() {
		cube(size = [screen_width,screen_hight,20], center = true);
		sphere(2);
	}

	// place the buttons
	for ( row_offset = [-(button_vertical_space/2), button_vertical_space/2]) {
		for ( id = [-1, 0, 1]) {
			// with the hole for the button
			translate( [id*(button_horizontal_space+2*button_radius), row_offset, 0] ) 
			 cylinder(20,button_radius,button_radius,center=true,$fn=smooth);
			// and of course a rounded corner for a professional look
			translate( [id*(button_horizontal_space+2*button_radius), row_offset, i] ) 
			 sphere(r = button_radius*1.3,$fn=smooth);
		}
	}
}
