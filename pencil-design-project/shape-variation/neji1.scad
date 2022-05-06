linear_extrude(height = 118, twist = 360, slices = 80) {
   difference() {
     offset(r = 2) {
      circle(6, center = true);
     }
     offset(r = 1) {
       circle(6, center = true);
     }
   }
 }