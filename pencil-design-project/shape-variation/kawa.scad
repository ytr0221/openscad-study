linear_extrude(height = 118, twist = 360, slices = 80) {
   difference() {
     offset(r = 4) {
      circle(2, center = true);
     }
     offset(r = 2) {
       circle(4, center = true);
     }
   }
 }