// in-7mm
include <BOSL2/std.scad>
//include <BOSL2/screws.scad>
//https://github.com/revarbat/BOSL2/wiki/threading.scad

include <BOSL2/threading.scad>




BODY_HEIGHT=10;//118;
INNER_R=3.5;



$fn=16;
threadhole_length=8;



difference(){
    cylinder(h = BODY_HEIGHT, r1 = 4, r2 = 4);
    
    cylinder(h = BODY_HEIGHT, r = INNER_R, $fn=500);
    
    
    translate([0,0,BODY_HEIGHT/2-threadhole_length/2]){
        //screw("#10-32", drive="hex", drive_size=1.5, length=12);
        //0.833
        $fn=300;
        threaded_rod(d=7.2, l=threadhole_length, pitch=0.8, left_handed=true, $fa=1, $fs=1);
    }
}