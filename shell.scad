module shell(b,h,w,r){

	gh = r * sin(90-atan(h/b));
	goff = gh / tan(90-atan(h/b));

	difference(){
		difference(){
			// base form
			rotate(a=[180,-90,0])
			 linear_extrude(height = w, center = true, convexity = 10, twist = 0)
			  polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);

			// rounding upper corner
			difference(){
				gx = (h/b)*(r+(r/sin(atan(h/b))));
				// cutting block
				rotate(a=[180,-90,0])
				 linear_extrude(height = w+0.1, center = true, convexity = 10, twist = 0)
				  polygon(points=[[h-gx,0],[h+0.1+r,-0.1],[h-gx+gh ,goff+r]], paths=[[0,1,2]]);
				// cylinder
				translate([0,-r,h-gx])
				 rotate(a=[90,90,90])
				  cylinder(w+4*pad,r,r,center=true,$fn=smooth);
			}
		}
		// rounding front corner
		fl = ((gh+r)*b)/h;
		difference(){
			// cutting block
			rotate(a=[180,-90,0])
			 linear_extrude(height = w+0.1, center = true, convexity = 10, twist = 0)
			  polygon(points=[[-0.1,b-fl-goff],[gh+r,b-fl],[0,b+0.2]], paths=[[0,1,2]]);
			// cylinder
			translate([0,-b+fl+goff,r])
			 rotate(a=[90,90,90])
			  cylinder(w+4*pad,r,r,center=true,$fn=smooth);
		}
	}
}