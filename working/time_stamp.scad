




R = 12;
sides = 6;

#cylinder(r=R, h=5, $fn=sides, center=true);

module stamp_text(text) {
rotate([0,90,90])
  translate([0,0,R*sin(60)])
    linear_extrude(height = 2) {
      text(text, size = 5, font = "Hiragino Mincho ProN", halign="center", valign="center");
    }
}



stamp_text(text="0");

in_angle = 60;
    
//z軸を中心に回転
rotate(a=in_angle, v=[0,0,1])
stamp_text(text="1");

rotate(a=in_angle*2, v=[0,0,1])
stamp_text(text="2");

rotate(a=in_angle*3, v=[0,0,1])
stamp_text(text="3");

rotate(a=in_angle*4, v=[0,0,1])
stamp_text(text="4");

rotate(a=in_angle*5, v=[0,0,1])
stamp_text(text="5");