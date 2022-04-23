//import("self_watering_planter_small_reservoir.STL");
//rotate([0,0,180]) import("self_watering_planter_small_pot.STL");

topRadius = 100/2;       // top smaller circle radius
bottomRadius = 80/2;    // bottom bigger circle radius
diameterStands = 2.4;   // diameter of sidewall sticks

amount = 128;       // amount of sticks
offsetAngle = 135;  // offset between top and bottom discs

z = 120; // height of reservoir
 
module rotateCopy(amount){
    for(i=[0:amount-1]){
        rotate([0,0,360/amount*i]) children();
    }
}

module reservoir(){
    x = topRadius/sin(90)*sin(offsetAngle);
    y = bottomRadius - sqrt(topRadius*topRadius-x*x);
    l = sqrt(x*x+y*y+z*z);
    alpha = asin(z/l);
    beta = atan(x/y);

    difference(){
    rotateCopy(amount) 
    union(){
        translate([0,bottomRadius-1,0])
        rotate([90-alpha,0,beta]) cylinder(h=l, d=diameterStands);
        
        rotate([0,0,360/amount/2])
        translate([0,bottomRadius-1,0])
        rotate([90-alpha,0,-beta]) cylinder(h=l, d=diameterStands);
    }
        
        translate([0,0,-0.5])cylinder(h=1, r=max(topRadius, bottomRadius)*2);
        translate([0,0,z-0.5])cylinder(h=1, r=max(topRadius, bottomRadius)*2);
    }

    cylinder(h=2, r=bottomRadius+diameterStands/10, $fn=128);

    translate([0,0,z-diameterStands/4])
    rotate_extrude($fn=128) 
    translate([topRadius-diameterStands/4,0,0]) circle(d=diameterStands+0.25);
}

module hollowCylinder(h,r1,r2,wall=2.4){
    difference(){
        cylinder(h=h,r1=r1, r2=r2);
        cylinder(h=h,r1=r1-wall, r2=r2-wall);
    }
}

module potFull(){
    
    topR = topRadius-diameterStands;
    middleR = bottomRadius-diameterStands;
    bottomR = 15;
    
    offsetBottom = 4;
    
    bottomZ = z/4+8-offsetBottom;
    middleZ = z/4-7.5;
    topZ = z - bottomZ - middleZ-offsetBottom;
    
    translate([0,0,4]){
    translate([0,0,bottomZ+middleZ]) cylinder(h=topZ,r1=middleR, r2=topR);
    translate([0,0,bottomZ]) cylinder(h=middleZ,r2=middleR, r1=bottomR);
    }
}

module pot(){
    
    topR = topRadius-diameterStands;
    middleR = bottomRadius-diameterStands;
    bottomR = 17.5;
    
    offsetBottom = 4;
    
    bottomZ = z/4+8-offsetBottom;
    middleZ = z/4-7.5;
    topZ = z - bottomZ - middleZ-offsetBottom;
    
    holes = 7;
    holesVertical = 8;
    
    chamberHeight = 20;
    
    translate([0,0,4]){
    translate([0,0,bottomZ+middleZ]) hollowCylinder(h=topZ,r1=middleR, r2=topR);
    
    difference(){
        translate([0,0,bottomZ]) hollowCylinder(h=middleZ,r2=middleR, r1=bottomR);
        for(k=[1:holesVertical])
            rotate([0,0,360/holesVertical*k+360/holes/2])
            translate([topR/2,0,0]) cylinder(h=z,d=2);
    }
    
    difference(){
    union(){ 
        hollowCylinder(h=bottomZ,r1=bottomR, r2=bottomR);
        cylinder(h=2.4,r=bottomR); 
        translate([0,0,2.4])
        difference(){
            cylinder(h=chamberHeight,r=bottomR-2.4);
            cylinder(h=chamberHeight,r1=bottomR-chamberHeight/2,r2=bottomR);
        }
    }
    for(j=[0:2])
    for(i=[0:holes-1])   
        translate([0,0,z/4/6+j*(z/4/3)+2.5]) 
        rotate([0,-90,i*360/holes+j*360/2/holes]) 
        cylinder(h=bottomR*2,d=4,center=false);
    
    difference(){
        cylinder(h=chamberHeight-5, r=bottomR);
        cylinder(h=chamberHeight-5, r1=bottomR/2,r2=bottomR);
    }
    }
    
    
    
    }
}

module reservoirInner(){
    a = bottomRadius-diameterStands - 15;
    b = z/4-7.5;
    
    // triangle offset
    translate([0,0,z/2-4.2])
rotate_extrude(angle=360)
translate([bottomRadius,0,0])
    union(){
    polygon([[0.5,0],[-a / b *7.5+1,0],[1,7.5]]);
    polygon([[0.5,0],[-a / b *7.5+1,0],[0,-a / b *7.5+1]]);
    }
    
    // smooth bootom
    innerRadius = bottomRadius-diameterStands/3;
    hollowCylinder(z/2-5,innerRadius,innerRadius,diameterStands);
}

module potCutout(){
    difference(){
        pot();
        translate([topRadius-10,0,z/2])
        cylinder(h=z/2, r1=10, r2=4);
        translate([topRadius-10,0,0])
        cylinder(h=z/2, r=10);
    }
    
    intersection(){
        potFull();
        translate([topRadius-10,0,0])
        hollowCylinder(h=z, r1=10+2.4, r2=10+2.4);
    }
}


union(){
    reservoir();
    reservoirInner();
}

potCutout();