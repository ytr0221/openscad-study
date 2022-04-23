$fn=100;

tol = 0.1;

difference(){
    // I need to center the original
    cylinder(r=4,h=5);
    
    translate([0,0,-2])
    cylinder(r=1.5*(1+tol),h=25);
}

translate([-1.5,1*(1+tol),0])
cube([3,1,5]);