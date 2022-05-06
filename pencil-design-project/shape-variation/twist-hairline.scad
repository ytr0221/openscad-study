 module orient_to(origin, normal) {   
      translate(origin)
      rotate([0, 0, atan2(normal.y, normal.x)]) //rotation
      rotate([0, atan2(sqrt(pow(normal.x, 2)+pow(normal.y, 2)),normal.z), 0])
      child();
}


module ruled_surface(limit,step) {
 for (x=[0:step:limit])
    assign(pf = f(x)) 
    assign(pg = g(x))
    assign(length = norm(pg  - pf))
    orient_to(pf, pg - pf)
        cylinder(r=Line_radius,h=length);   
};


function f(a) = [ Radius * cos(a), 
                       Radius * e * sin(a),
                       0];
function g(a) = [ Radius * cos(a+Phase), 
                   Radius * e * sin(a + Phase),
                   0]
                 + [0,0,Height];


Phase = 120;
Height = 118;
Radius = 6;

Line_radius=1;
e=1;
Step=4;
ruled_surface(360,Step);   

function norm(v) =
    pow(v.x*v.x + v.y*v.y + v.z*v.z,0.5);