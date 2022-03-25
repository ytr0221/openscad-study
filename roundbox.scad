
module roundbox()
{
    $fn = 100;

    difference(){
      minkowski(){
          cube([10,20,10], center=true);
          sphere(0.5);
          
      }  
      
      translate([0,0,5]) cube([19,29,10], center=true);
      
      translate([0,0,-1]){
          linear_extrude(10) {
              minkowski(){
                   square([9,19], center=true);
                   circle(0.5);
              }
          }
      }
      
      
      translate([0,0,0]){
              minkowski(){
                   cube([8,18,8], center=true);
                   cylinder(r=0.5,h=1);
                   //sphere(0.5);
              }
      }

    };
};

translate([5,10,5]) roundbox();