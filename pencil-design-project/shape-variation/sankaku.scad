
// in-7mm
include <BOSL2/std.scad>
//include <BOSL2/screws.scad>
//https://github.com/revarbat/BOSL2/wiki/threading.scad

include <BOSL2/threading.scad>




BODY_HEIGHT=118;//118;
INNER_R=3.5;



$fn=36;
threadhole_length=118;//6;



difference(){
linear_extrude(height = 118, twist = 360, slices = 80) {
       //difference() {
         //offset(r = 6) {
          circle(6, center = true);
         //}
         //offset(r = 4) {
         //  circle(6, center = true);
         //}
       //}
     }
    
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


