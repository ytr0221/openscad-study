module shape()
{    
    polygon([[0,0],[30,0],[30,30],[15,20],[0,45]]);
}

module smooth(r=3)
{
    $fn=30;
    offset(r=r)
    offset(r=-r)
    children();
}

module fillet(r=3)
{
    $fn=30;
    offset(r=-r)
    offset(r=r)
    children();
}

translate([0,0])
{
    translate([0,-15,0])
    resize([30,0,0])
    %text("Original", size = 5);

    shape();
}
    
translate([40,0])
{
    translate([0,-15,0])
    resize([30,0,0])
    %text("Smooth()", size = 5);

    smooth()
    shape();
}

translate([80,0])
{
    translate([0,-15,0])
    resize([30,0,0])
    %text("Fillet()", size = 5);

    fillet(r=3)
    shape();
}

#translate([120,0])
{
    translate([0,-15,0])
    resize([30,0,0])
    %text("Smooth()Fillet()", size = 5);
    smooth()
    fillet()
    shape();
}