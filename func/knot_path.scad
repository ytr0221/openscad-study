// An application of the minimum rotation
// Given to points p0 and p1, draw a thin cylinder with its
// bases at p0 and p1
module line(p0, p1, diameter=1) {
    v = p1-p0;
    translate(p0)
        // rotate the cylinder so its z axis is brought to direction v
        multmatrix(rotate_from_to([0,0,1],v))
            cylinder(d=diameter, h=norm(v), $fn=4);
}
// Generate the polygonal points for the knot path 
knot = [ for(i=[0:2:360])
         [ (19*cos(3*i) + 40)*cos(2*i),
           (19*cos(3*i) + 40)*sin(2*i),
            19*sin(3*i) ] ];
// Draw the polygonal a segment at a time
for(i=[1:len(knot)-1]) 
    line(knot[i-1], knot[i], diameter=5);
// Line drawings with this function is usually excruciatingly lengthy to render
// Use it just in preview mode to debug geometry