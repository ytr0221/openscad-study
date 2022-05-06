// in-7mm
include <BOSL2/std.scad>
//include <BOSL2/screws.scad>
//https://github.com/revarbat/BOSL2/wiki/threading.scad

include <BOSL2/threading.scad>




BODY_HEIGHT=118;//118;
INNER_R=3.5;



$fn=36;
threadhole_length=120;//6;




/*
translate([0,5,-0.5]){
cylinder(h = 0.5, r = 0.5);
}

translate([0,-5,-0.5]){
cylinder(h = 0.5, r = 0.5);
}

translate([5,0,-0.5]){
cylinder(h = 0.5, r = 0.5);
}

translate([-5,0,-0.5]){
cylinder(h = 0.5, r = 0.5);
}*/

//external diameter
diameter=10;
height=118;
//N of polygon sides
faces=8;
//vertical subdivisions
segments=32;
//walls and base thickness
wall=3;
hollow=false; // [true,false]



module twisted_vase(diameter,height,faces,segments,wall,hollow) {
	
	e=.01;
	
	difference() {
		for(i=[0:segments-1]) 
			hull() {
				translate([0,0,height/segments*i])
					rotate([0,0,180/faces*(i%2)])
						cylinder(d=diameter, h=e, $fn=faces);
				translate([0,0,height/segments*(i+1)])
					rotate([0,0,180/faces*((i+1)%2)])
						cylinder(d=diameter, h=e, $fn=faces);
		}
		if(hollow)
			for(i=[0:segments-1]) 
				hull() {
					translate([0,0,height/segments*i])
						rotate([0,0,180/faces*(i%2)])
							cylinder(d=diameter-wall*2, h=e*2, $fn=faces);
					translate([0,0,height/segments*(i+1)])
						rotate([0,0,180/faces*((i+1)%2)])
							cylinder(d=diameter-wall*2, h=e*2, $fn=faces);
			}	
	}
	if(hollow) cylinder(d=diameter-wall*2+e, h=wall, $fn=faces);

}




difference(){
    
    twisted_vase(diameter,height,faces,segments,wall,hollow);
    
    
    translate([0,0,threadhole_length/2]){
        //screw("#10-32", drive="hex", drive_size=1.5, length=12);
        //0.833
        $fn=300;
        //7.5 0.80
        //7.7 0.833 ??
        //7.7 0.8
        
        //8.2 0.83!!
        
        //zortax m300 PLA pitch 0.09mm 
        threaded_rod(d=8.4, l=threadhole_length, pitch=0.8333, left_handed=true, $fa=1, $fs=1);
    }
}




