include <tray.scad>


include <BOSL2/std.scad>
include <BOSL2/screw_drive.scad>
include <BOSL2/std.scad>

module stars() {
    
for ( i = [0:4:20] )
    {
        for ( j = [0:4:20] )
        {
            translate([i,j,0]){
                linear_extrude(height = 10, center = true)
                star(n=7, r=1, step=3, realign=true);
            }
        }
}

}



    
difference() {
    tray([90, 90, 25], n_columns=3, n_rows=[3,3,3], dividers_thickness=2, dividers_bottom_bevel_radius=1);


    
        translate([6,6,0]){
        stars();
        }
        
        translate([6,35,0]){
        stars();
        }
        
        translate([6,65,0]){
        stars();
        }
        
        translate([35,6,0]){
        stars();
        }
        
        translate([35,35,0]){
        stars();
        }
        
        translate([35,64,0]){
        stars();
        }
        
         translate([64,6,0]){
        stars();
        }
        
        translate([64,35,0]){
        stars();
        }
        
        translate([64,64,0]){
        stars();
    
}
}


