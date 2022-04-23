width = 13; // # columns in texture.txt
height = 14;// # lines in texture.txt
thick = 3;  // max value in texture.txt

module wall()
    intersection(){
        rotate(-135) translate([0,0,-height/2-1]) cube([width/sqrt(2),width/sqrt(2),height+2]);
    translate([-0.01,-(width-4-thick)/2,0])
        rotate([90,0,0])
            surface(file="texture.txt",center=true);
    }
   
wall();
rotate(90) wall();
rotate(180) wall();
rotate(270) wall();