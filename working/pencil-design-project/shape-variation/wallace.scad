module orient_to(origin, normal) {   
      translate(origin)
      rotate([0, 0, atan2(normal.y, normal.x)]) //rotation
      rotate([0, atan2(sqrt(pow(normal.x, 2)+pow(normal.y, 2)),normal.z), 0])
      child();
}

module ruled_surface(limit,step,params) {
 for (x=[0:step:limit])
    assign(pf = f(x,params)) 
    assign(pg = g(x,params))
    assign(length = norm(pg-pf))
    orient_to(pf,pg-pf)
        cylinder(r=Line_radius,h=length);   
};

function f(a,phase) = [ Radius * cos(a), 
                        Radius * e * sin(a),
                       0];
function g(a,phase) = Top_ratio * [ Radius * cos(a+phase), 
                   Radius * e * sin(a + phase),
                   0]
                 + [0,0,Height];


Phase=120;
Height = 118;
Radius = 20;

Line_radius=1.5;
e=1;//1.5;
Top_ratio = 1; //0.8;

Step=20;

union(){
   ruled_surface(360,Step,Phase);
   ruled_surface(360,Step,-Phase);
}