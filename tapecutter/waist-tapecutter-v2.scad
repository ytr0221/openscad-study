depth = 95;
width = 60;
height = 25;

thickness = 5;

module smooth(r=3)
{
    $fn=30;
    offset(r=r)
    offset(r=-r)
    children();
}

module fillet(r=3)
{
    $fn=30;
    offset(r=-r)
    offset(r=r)
    children();
}


//side
translate([width/2+thickness/2,0,height/2]) rotate([0,90,0]) 
        cube([height+thickness,depth,thickness], center=true);

translate([-width/2-thickness/2,30,height/2]) rotate([0,90,0]) 
        cube([height+thickness,30,thickness], center=true); 
       
//bottom


difference() {
translate([0,100/4+5, -thickness/2]) linear_extrude(height=thickness, convexity=20) smooth() square([width,100/2-10], center=true);



translate([0,100/4+5, -thickness/2 + 1.5]) {
dm = 3.2;
translate([-50/2,-30/2, 0])
cylinder(5-1,dm/2,dm/2);

translate([50/2,30/2, 0])
cylinder(5-1,dm/2,dm/2);

translate([50/2,-30/2, 0])
cylinder(5-1,dm/2,dm/2);

}
}


//lid

translate([0,50,25]) rotate([0,180,0])
{
difference(){
translate([0,100/4+5, 25-thickness/2]) linear_extrude(height=thickness, convexity=20) smooth() square([width,100/2-10], center=true);
translate([0,30,0]) cylinder(25,14.3,14.3);
}

dm = 3;
translate([0,100/4+5, -thickness/2 + 1.5]) {
translate([-50/2,-30/2, 0])
cylinder(25,dm/2,dm/2);

translate([50/2,30/2, 0])
cylinder(25,dm/2,dm/2);

translate([50/2,-30/2, 0])
cylinder(25,dm/2,dm/2);

}
}



//tape_holder
difference(){
translate([0,30,0]) cylinder(25,14.2,14.2);
translate([0,30,0]) cylinder(25,10.2,10.2);
}

#translate([0,30,0]) cylinder(25,25,25);




//Filament Clip JTN 20200927

$fn =100;											//number of segments in a 360 degree circle
eps=0.01;											//a small number sometimes needed to make ends meet

th = 3;												//material thickness
rr = 0.2;											//rounding radius
ct = 25;												//clip thickness

//wedge
ww = 3.5;											//wedge width
wh = 13;												//wedge height

//ribbed section
rh = 55;											//ribbed section height
rd = 2;												//rib depth

//curved section
cd = 15;											//curve outer diameter
ca = 188;											//curve in degrees

//filament hole section
fh = 40;												//filament hole section length
fhr = 0;											//filament hole radius
fhs = 2;											//make the hole a bit elliptic

//hairpin turn
hd = 4.5;											//hairpin outer diameter
ha = 175;											//hairpin angle

//end
ed = 0;											//end diameter
ea = 220;											//end angle

sec = 360/$fn;	//sector size
echo("sector size:",sec,"degrees");

function ta(ra) = round(ra/sec)*sec;				//true angle to match the thickness exactly at sector ends
function cds(d) = d/cos(360/$fn/2);					//circle radius from the polygon side to side distance

module sector(a=90, r=100) {						//leave a sector of a degrees at the origin, sweeping counter clockwise with a radius of r
	b = (a==360) ? 360:a%360;						//don't take away anything if the angle is exactly 360 degrees or a multiple
	difference() {
		children();
		if (b<=270) {
			rotate(b) square(2*r);					//safely remove 90 degrees the requested angle
			if(b<90) rotate(90) square(2*r);		//remove the 2nd quadrant
			if(b<180) rotate(180) square(2*r);		//remove the 3rd quadrant
			rotate(270) square(2*r);				//remove the 4th quadrant
		}
		else {										
			difference() {							//we are in the 4th quadrant so only remove up to 360 degrees
				rotate(b) square(sqrt(2*r*r));
				square(2*r);
			}
		}
	}
}

	
module wedge(h=3, w=2) {								//draw a pointed wedge centered on x=0 and the y going to -h
	p= [[-w/2,0],[w/2,0],[-w/2,-h]];
	polygon(p);
}


module ribbed_section(h=10, d=2) {						//a ribbed segment of length h with ribs of depth d protruding every mm
v = th/2;
p = [for (a = [0:h]) [a,v],	for (a = [h:-1:0]) [a,-v-a%2*d]];
	translate([-h/2,0]) polygon(p);
	*echo(p);
}

module arc(od, a) {
	sector(ta(a)) rotate(180/$fn) difference() {		//start from the curved top and rotate it to start from the negative x-axis
		circle(d=cds(od));								//we use the polygon side to side distances for exact positioning
		circle(d=cds(od-2*th));
	}
}

module filament_hole(h=10, hr=0.8) {					//a straight segment of length h with a recess for filament of radius r in the middle
	difference() {
		union() {
			translate([0,-th/2]) circle(hr+th);
			square([h,th], center=true);
		}
		translate([0,-th/2]) scale([fhs,1]) circle(hr);
		translate([0,-(hr+th)-th/2]) square(2*(hr+th),center=true);
	}
}

module filament_clip2d() {
	rotate([0,0,-ta(ca)-180]) arc(cd,ca);											//start from the curved top and rotate it to start from the negative x-axis
	translate([-cd/2+th/2,-rh/2]) rotate(90) ribbed_section(rh,rd);					//position the ribbed section
	translate([-cd/2+ww/2,-rh]) wedge(wh,ww);										//position the tip																			
	//the rest needs to be positioned as one unit as it needs to rotate with the changing angle of the curved section on top
	rotate(-ta(ca)-180) translate([cd/2-th/2,eps]) union() {
		translate([0,-fh/2]) rotate(90)  filament_hole(fh,fhr);						//1st section with the filament hole
		translate([hd/2-th/2,-fh])  union() {										//the rest needs to rotate with the hairpin angle s well
			rotate(180) arc(hd,ha);													//the hairpin angle
			rotate(-180-ta(-ha)) union() {
				translate([hd/2-th/2,fh/2-eps]) rotate(-90) filament_hole(fh,fhr);	//the other side of the filament hole
				translate([hd/2-th+ed/2,fh-eps]) rotate(-ta(ea)-180)arc(ed,ea);		//the curved "handle"
			}
		}
	}	
}

module cutter() {
	rotate([0,0,-ta(ca)-180]) arc(cd,ca);											//start from the curved top and rotate it to start from the negative x-axis
				//position the ribbed section
										//position the tip																			
	//the rest needs to be positioned as one unit as it needs to rotate with the changing angle of the curved section on top
	rotate(-ta(ca)-180) translate([cd/2-th/2,eps]) union() {
		translate([0,-5/2]) rotate(90)  filament_hole(5,fhr);						//1st section with the filament hole
		translate([hd/2-th/2,-5])  union() {										//the rest needs to rotate with the hairpin angle s well
			translate([2.75,0,0]) rotate(180) arc(10,ha);													//the hairpin angle
			rotate(-180-ta(-ha)) union() {
				translate([hd/2-th/2+5.5,5/2-eps]) rotate(-90) filament_hole(6,fhr);	//the other side of the filament hole
				//translate([hd/2-th+5/2,5-eps]) rotate(-90) arc(20,90);		//the curved "handle"
			}
		}
	}	
}

translate([42,45,0])
linear_extrude(height=ct, convexity=20) 
	offset(-rr) offset(rr) offset(rr) offset(-rr) filament_clip2d();

    
 //blade and blade holder
    
 {
    translate([-width/2-22.5,45,height/2]) rotate([170,90,0]) linear_extrude(height=1.2,convexity=20) ribbed_section(height,2.5);	

        
    translate([-39,45,height])  rotate([0,180,0]) 
    linear_extrude(height=ct, convexity=20) 
        offset(-rr) offset(rr) offset(rr) offset(-rr) cutter();
    }






