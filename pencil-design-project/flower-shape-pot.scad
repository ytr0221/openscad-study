dia = 75;
height = 100;

a1 = 1;
b1 = 5;
a2 = 4;
b2 = 7;

wall = 4 * 0.4;

f = function(t) [
    dia / 2 * sin(t) + a1 * cos(b1 * t) + a2 * sin(b2 * t),
    dia / 2 * cos(t) + a1 * sin(b1 * t) + a2 * cos(b2 * t)
];

module shape() polygon([for (a = [0:359]) f(a)]);

module tool_box() {
    linear_extrude(wall)
        shape();

    linear_extrude(height) {
        difference() {
            shape();
            offset(-wall) shape();
        }
    }
}

tool_box();