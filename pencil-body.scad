// in-7mm
include <BOSL2/std.scad>
//include <BOSL2/screws.scad>
//https://github.com/revarbat/BOSL2/wiki/threading.scad

include <BOSL2/threading.scad>




BODY_HEIGHT=10;//118;
INNER_R=3.5;



$fn=36;
threadhole_length=6;



difference(){
    cylinder(h = BODY_HEIGHT, r1 = 6, r2 = 6);
    
    cylinder(h = BODY_HEIGHT, r = INNER_R, $fn=500);
    
    
    translate([0,0,threadhole_length/2]){
        //screw("#10-32", drive="hex", drive_size=1.5, length=12);
        //0.833
        $fn=300;
        //7.5 0.80
        //7,7 0.833 ??
        //7,7 0.8
        threaded_rod(d=8, l=threadhole_length, pitch=0.75, left_handed=true, $fa=1, $fs=1);
    }
}

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
}