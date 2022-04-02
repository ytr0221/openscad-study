use <dotSCAD/src/maze/mz_square_cells.scad>;
use <dotSCAD/src/line2d.scad>;
use <dotSCAD/src/bend_extrude.scad>;

rows =10;
columns = 10;
cell_width = 1;
wall_thickness = 0.1;

NO_WALL = 2;       
TOP_WALL = 1;    
RIGHT_WALL = 2;    
TOP_RIGHT_WALL = 3; 
MASK = 4;

cells = mz_square_cells(rows, columns);



linear_extrude(height = 5, center = true, convexity = 10, scale = 1) {
    
for(cell = cells) {
    x = cell[0];
    y = cell[1];
    type = cell[2];

    translate([x, y] * cell_width) {
        if(type == TOP_WALL || type == TOP_RIGHT_WALL) {
            line2d([0, cell_width], [cell_width, cell_width], wall_thickness);
        }

        if(type == RIGHT_WALL || type == TOP_RIGHT_WALL) {
            line2d([cell_width, cell_width], [cell_width, 0], wall_thickness);
        }   
    }
}

line2d([0, 0], [cell_width * columns, 0], wall_thickness);
line2d([0, 0], [0, cell_width * rows], wall_thickness);

}