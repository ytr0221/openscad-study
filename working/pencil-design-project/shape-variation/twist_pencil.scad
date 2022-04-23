linear_extrude(height = 118, twist = 360, slices = 100) {
   difference() {
     offset(r = 6) {
      square(10, center = true);
     }
     offset(r = 4) {
       square(10, center = true);
     }
   }
 }