$fn = 16;

helix_radius = 6;
z_step = 0.05;
rot_step = 15;

module segment(i = 1) {
    hull() {
        translate([0, 0, (i-1) * z_step])
            rotate([0, 0, (i-1) * rot_step])
            translate([helix_radius, 0, 0])
            sphere(r = 0.29);
        translate([0, 0, i * z_step])
            rotate([0, 0, i * rot_step])
            translate([helix_radius, 0, 0])
            sphere(r = 0.29);
    }
}

for (i = [1:360]) {
    segment(i);
}