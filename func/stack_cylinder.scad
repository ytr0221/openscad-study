// Define the sizes for the cylinders, first value is the
// radius, the second is the height.
// All cylinders are to be stacked above each other (with
// an additional spacing of 1 unit).
sizes = [ [ 26, 3 ], [ 20, 5 ], [ 11, 8 ],  [ 5, 10 ], [ 2, 13 ] ];

// One option to solve this is by using a recursive module
// that creates a new translated coordinate system before
// going into the next level.
module translated_cylinder(size_vector, idx = 0) {
    if (idx < len(size_vector)) {
        radius = size_vector[idx][0];
        height = size_vector[idx][1];

        // Create the cylinder for the current level.
        cylinder(r = radius, h = height);

        // Recursive call generating the next cylinders
        // translated in Z direction based on the height
        // of the current cylinder
        translate([0, 0, height + 1]) {
            translated_cylinder(size_vector, idx + 1);
        }
    }
}

// Call the module to create the stacked cylinders.
translated_cylinder(sizes);