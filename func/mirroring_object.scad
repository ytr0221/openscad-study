// A custom mirror module that retains the original
// object in addition to the mirrored one.
module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}

module mirroring_object(){
        difference() {
            cube(10);
            //sphere(10);
            //cylinder(r = 8, h = 30, center = true);
        }
}

// Define example object.
module object(spacing_x=5, spacing_y=5) {
    translate([spacing_x, spacing_y, 0]) {
        mirroring_object();
    }
}

// Call mirror_copy twice, once using the default to
// create a duplicate mirrored on X axis and
// then mirror again on Y axis.

    
    mirror_copy([0, 1, 0])
        mirror_copy()
            object();
            
