//Kevin Toppenberg, MD
//4/5/18
//This is a remix of Geneva Mechanism by Jasper_Pues: 
//  https://www.thingiverse.com/thing:484513
//I have remodel this in OpenSCAD

//Crude animation is provided.  To activate:
//  View Menu --> Animate
//  Enter in FPS of 30 and Steps of 360

tolerance = 0.4;
shaft_tolerance = 0.1;

fob = [40.3, 8, 2];
shaft_d = 4.2; //fob.y - 1.8;

shaft1_base_d = fob.y;
shaft1_base_h = 1;

shaft2_offset = 22.2;
shaft2_base_d = fob.y;
shaft2_base_h = 3.9 + shaft1_base_h + tolerance;

shaft_h = 11 + shaft1_base_h; //9.5;


wheel_d = 30;
wheel_h = 3;
wheel_curve_d = 24.3;
wheel_curve_offset = 22.5;
wheel_slot_d = 5;
wheel_slot_offset = 6.5;

pin_wheel_d = 36.5;
pin_wheel_h = 2;
pin_wheel_d2 = 24;
pin_wheel_h2 = 3 + tolerance * 2;
pin_wheel_curve1_d = 31;
pin_wheel_curve1_offset = 22.15;

pin_wheel_curve2_d = 13;
pin_wheel_curve2_offset = 20.85;

pin_wheel_pin_offset_x = 15; //15.74; <--- this to match original, but not really needed
pin_wheel_pin_offset_y = 0; //0.47; <--- this to match original, but not really needed
pin_wheel_pin_d = 4;

//--------------------------------
show_base               = 1;
show_top                = 1;
show_original_holder    = 0;
show_original_wheel     = 0;
show_wheel              = 1;
show_original_pin_wheel = 0;
show_pin_wheel          = 1;
//--------------------------------


if (show_original_pin_wheel == 1) {
  rotate([0,0,1.7])
  translate([-18, -(18+0.05), 0])
    import("Pin_Wheel_V2.stl", convexity=6);  
}  

if (show_pin_wheel == 1) {
  translate([fob.x, fob.y/2, fob.z + shaft1_base_h]) 
  rotate([0,0,360*$t]) {
    difference() {
      union() {//all addative stuff
        color("blue")
        cylinder(d=pin_wheel_d, h= pin_wheel_h, $fn=100);
        color("steelblue")
        translate([0,0,pin_wheel_h])
          cylinder(d=pin_wheel_d2, h=pin_wheel_h2, $fn=100);
      }
      union() { //all subtractive stuff
        translate([0,0,-0.5])
          cylinder(d=wheel_slot_d-0.2 , h=10, $fn=100);
        translate([pin_wheel_curve1_offset, 0, pin_wheel_h+0.01])
          cylinder(d=pin_wheel_curve1_d, h=pin_wheel_h2+1, $fn=100);
        deltaA = 360/8;
        for (angle=[deltaA-2.5:deltaA:360-deltaA]) {
          translate([cos(angle) * pin_wheel_curve2_offset, sin(angle) * pin_wheel_curve2_offset, -0.5])
            cylinder(d=pin_wheel_curve2_d, h=pin_wheel_h2+1, $fn=50);
        }      
      }       
    }  
    color("white")
    translate([pin_wheel_pin_offset_x, pin_wheel_pin_offset_y, pin_wheel_h])
      cylinder(d=pin_wheel_pin_d, h=pin_wheel_h2, $fn=50);
  }
}  

if (show_original_wheel == 1) {
  %translate([-15.1, -(15-0.05),0])
    import("Geneva_Wheel_V2_kt.stl", convexity=6);
}

if (show_wheel == 1) {
  start_time = 0.375;
  end_time   = 0.630;
  if (($t < start_time) || ($t > end_time)) {
    rot_angle = 45;
    wheel(rot_angle);
  } else {
    delta_time = end_time - start_time;
    local_t = $t - start_time;
    pct_t = local_t / delta_time; // 0 to 1 
    base_rot_rate = 90 / 1;  //rotate 90 degrees over delta time
    sin_t = pct_t * 360;
    sin_v = -sin(sin_t);
    added_rot_rate = 20 * sin_v;
    net_rot_rate = base_rot_rate + added_rot_rate;
    rot_angle = 45 + net_rot_rate * pct_t;  //NOTE: <--- this formula is not right, but I can't figure out the trig for this in a timely manner. So will leave this as approximation
    wheel(-rot_angle);
  }    
}

module wheel(rot_angle) {
  color("red")
  translate([fob.x - shaft2_offset, fob.y/2, shaft2_base_h])
  rotate([0,0,rot_angle])
  difference() {
    cylinder(d=wheel_d, h=wheel_h, $fn=100);
    union() {  //all subtractive stuff
      translate([0,0,-0.5])
        cylinder(d=wheel_slot_d-0.2 , h=wheel_h+1, $fn=100);
      for (angle=[45+0:90:45+270]) {
        translate([wheel_curve_offset * cos(angle), wheel_curve_offset * sin(angle),-0.5])
          cylinder(d=wheel_curve_d , h=wheel_h+1, $fn=100);
      }  
      for (angle=[0:90:270]) {
        translate([wheel_slot_offset * cos(angle), wheel_slot_offset * sin(angle),-0.5])
          cylinder(d=wheel_slot_d , h=wheel_h+1, $fn=100);
        rotate([0,0, angle])
          translate([wheel_slot_offset, - wheel_slot_d/2, - 0.5])
            cube([10,wheel_slot_d, wheel_h+1]);
      }        
    } 
  }   
}  

if (show_original_holder == 1) {
  %translate([-3,1,0])
    import("Holder_-_Small_Clearance__06_mm_.stl", convexity=6);
}  


if (show_base == 1)  {
  difference() {
    union() {  //all addative parts
      cube(fob);
      translate([0, fob.y/2, 0])
        cylinder(d=fob.y, h=fob.z, $fn=50);
      translate([fob.x, fob.y/2, 0])
        cylinder(d=fob.y, h=fob.z, $fn=50);  
      translate([fob.x, fob.y/2, 0])  //shaft 1
        cylinder(d=shaft_d, h=shaft_h, $fn=50);      
      translate([fob.x, fob.y/2, fob.z])  //shaft 1  base
        cylinder(d=shaft1_base_d, h=shaft1_base_h, $fn=50);
      translate([fob.x - shaft2_offset, fob.y/2, 0])  //shaft 2
        cylinder(d=shaft_d, h=shaft_h, $fn=50);
      translate([fob.x - shaft2_offset, fob.y/2, 0])  //shaft 2 base
        cylinder(d=shaft2_base_d, h=shaft2_base_h, $fn=50);  
    }
    union() { //all subtractive parts
      translate([0, fob.y/2, -0.5])
      cylinder(d=shaft_d, h=fob.z+1, $fn=50);
    }  
  }  
}

if (show_top == 1) {
  difference() {
    union() { //all addative parts
      translate([fob.x - shaft2_offset, 0, shaft_h - fob.z])
        cube([shaft2_offset, fob.y, fob.z]);
      translate([fob.x, fob.y/2, shaft_h - fob.z])
        cylinder(d=fob.y, h=fob.z, $fn=50);  
      translate([fob.x, fob.y/2, shaft_h - fob.z - shaft1_base_h])
        cylinder(d=fob.y, h=shaft1_base_h, $fn=50);  
      translate([fob.x - shaft2_offset, fob.y/2, shaft_h - fob.z])
        cylinder(d=fob.y, h=fob.z, $fn=50);  
      translate([fob.x - shaft2_offset, fob.y/2, shaft_h - fob.z - shaft1_base_h - tolerance])
        cylinder(d=fob.y, h=shaft1_base_h + tolerance, $fn=50);              
    }
    union() { //all subtractive parts
      translate([fob.x, fob.y/2, shaft_h - fob.z - 0.5 - shaft1_base_h])
        cylinder(d=shaft_d + shaft_tolerance*2 , h=fob.z+shaft1_base_h + 1, $fn=50);  
      translate([fob.x - shaft2_offset, fob.y/2, shaft_h - fob.z - 0.5 - shaft2_base_h])
        cylinder(d=shaft_d + shaft_tolerance*2 , h=fob.z+1 + shaft2_base_h + tolerance, $fn=50);  
    }  
  }
}  