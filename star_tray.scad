include <BOSL2/screw_drive.scad>
include <BOSL2/std.scad>

module stars() {
    for ( i = [0:2.5:20] )
        {
            for ( j = [0:2.5:20] )
            {
                translate([i,j,0]){
                    linear_extrude(height = 10, center = true)
                    star(n=7, r=1, step=3, realign=true);
                }
            }
    }
};

module roundBox(x,y,z,r,smooth,center = false){
  linear_extrude(height = z, center = center)
    translate([x/2, y/2, 0]){
        hull() {
          translate([x/2-r,y/2-r,0]) circle(r, $fn=smooth);
          translate([x/2-r,-y/2+r,0]) circle(r, $fn=smooth);
          translate([-x/2+r,-y/2+r,0]) circle(r, $fn=smooth);
          translate([-x/2+r,y/2-r,0]) circle(r, $fn=smooth);
        }
    }
}

module RBox(){
   difference(){
       hull(){
           for (p = points){
               translate(p) cylinder(d=4, h=4,center=true);
           }
       }
       for (p = points){
           translate(p) cylinder(d=2, h=5,center=true);
       }
   }
}


color([1,0,0]){
    points=[[10,10,0],[-10,10,0],[10,-10,0],[-10,-10,0]];
    for (p = points){
       translate(p*4) cylinder(d=4, h=3,center=true, $fn=50);
    }
}
//RBox();


height = 25;
wall_thick = 2;
diff = wall_thick/2+0.5;
cell_size = 27;


difference(){
    roundBox((cell_size+wall_thick*2-diff)*3,(cell_size+wall_thick*2-diff)*3,height,1,50);

    translate([wall_thick, wall_thick, 0]){
    
   
        for(i=[0:2]){
            for(j=[0:2]){
                translate([i * (cell_size+wall_thick), j*(cell_size+wall_thick), 0]){
                    roundBox(cell_size, cell_size, height,1,50);
                }
            }
        }
    }
    
}


difference(){

roundBox((cell_size+wall_thick*2-diff)*3,(cell_size+wall_thick*2-diff)*3,3,1,50);

        translate([5.5,5.5]){

        for(i=[0:2]){
            for(j=[0:2]){
                translate([i * (cell_size+wall_thick), j*(cell_size+wall_thick), 0]){
                    stars();
                }
            }
        }
        
        }
        
        
 }