$fs=$preview?1:.2;
$fa=$preview?4:1;

sides=8;
radius=40;
wall=1.2;
height=80;
twist=180;

difference(){
	linear_extrude(height, twist=twist, slices=height/$fs)
	    	circle(r=radius,$fn=sides);
	translate([0,0,wall])
	    	linear_extrude(height, twist=twist, slices=height/$fs)
	    	    	circle(r=radius-wall,$fn=sides);
}