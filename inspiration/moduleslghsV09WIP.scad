/*═══════════════════════════════════════════════════════════╕
│    Modules de déformation et modification pour OpenSCAD    │
╞══════════════╤════════════════════════════════╤════════════╡
│ wiki.lghs.be │ LGPL 2.1 marc@vanlindt.be 2019 │    v0.8    |
╞══════════════╧════════════════╤═══════════════╧════════════╛
│      Variables générales       \
╘═══════════════════════════════*/

  phi       = 1.61803399;
  aphi      = phi-1;
  biphi     = phi+1;
  angledor  = 360/biphi;
  py        = sqrt(0.5);
  bipy      = sqrt(2);
  pi        = 3.141592654;
  tau       = pi*2;
  
/*═══════════╕
│  Exemples   \
╘════════════*/

/* MOEBIUS / ELLIPSE
  moebius(n=32,d=40,t=0.5)
  ellipse([5,20],$fn=128);
  moebius(n=32,d=40,t=0.5)
  ellipse([20,5],$fn=128);
*/



 /* PYTHATREE / BONE
   pythatree(d="z",h=50,m=4)
   bone(h=50,d1=20,d2=14.14214,c=40,$fn=64);
*/

/* ROTATE2
  rotate2()
  cube(center=true);
  translate([0,2,0])
  cube(center=true);
*/

/* RING
  ring(d=10,n=11)
  cylinder(d=1);
*/

/* SKEW
  skew(XY=1)
  cube([2,2,2]);
*/

/* ROUNDSQUARE
  roundsquare(s=[40,20],d=[5,10,5,15],$fn=64,center=true);
*/

/* NGON
  ngon(d=20,fn=3,inside=true);
  translate([0,0,-1])   #cylinder(d=20,$fn=64);

  translate([25,0,0])   ngon(d=20,fn=3,inside=false);
  translate([25,0,-1])  #cylinder(d=20,$fn=64);

  translate([50,0,0])ngon(d=20,f=4,inside=true);
  translate([50,0,-1])#cylinder(d=20,$fn=64);

  translate([75,0,0])ngon(d=20,fn=4,inside=false);
  translate([75,0,-1])#cylinder(d=20,$fn=64);

  translate([100,0,0])ngon(d=20,fn=5,inside=true);
  translate([100,0,-1])#cylinder(d=20,$fn=64);

  translate([125,0,0])ngon(d=20,fn=5,inside=false);
  translate([125,0,-1])#cylinder(d=20,$fn=64);
*/
/* OUTLINE
  outline(w=1,t="in")
  {
    ellipse([10,20],$fn=64);ellipse([20,10],$fn=64);
  }
  translate([0,0,1]){#ellipse([10,20],$fn=64);#ellipse([20,10],$fn=64);}

  translate([25,0]){
    outline(w=1,t="out")
    {
      ellipse([10,20],$fn=64);ellipse([20,10],$fn=64);
    }
    translate([0,0,1]){#ellipse([10,20],$fn=64);#ellipse([20,10],$fn=64);}
  }

  translate([55,0]){
    outline(w=1,t="on")
    {
      ellipse([10,20],$fn=64);ellipse([20,10],$fn=64);
    }
    translate([0,0,1]){#ellipse([10,20],$fn=64);#ellipse([20,10],$fn=64);}
  }
*/
/* RANDOM
  for(i=[1:10]){
    echo(random(10,s=i));
  }
*/
/* FIBONACCI
for(i=[1:15]){
  echo(fibonacci(i));
}
*/

/* TEARDROP / RANDOM
 for(i=[1:500]){
   translate([random(500,i*10),random(500,i*50),random(500,i*60)])
   color([0.6,0.6,0.9,0.5])teardrop(a=30+random(30,i));
 }
*/

/* STAR
  star(d1=10,d2=20,fn=9);
*/

/* TUBE - COUDE
   tube(d1=10,d2=8,h=15,$fn=64);
   
   translate([0,0,15])
   coude(d1=10,d2=8,a=45,$fn=64);
 
   translate([0,0,20])
   rotate([0,045,0])
   translate([0,0,5])
   tube(d1=10,d2=8,h=5,$fn=64);
*/



/* ROUNDCUBE
roundcube(s=[50,100,150],b=[5,15,15,20],t=[25,35,40,5],$fn=64,center=true);
*/
/* PAIR
for(i=[0:20]){
  echo(str(i,pair(i)==true?" est pair!":" est impair!"));
}
*/
/* GRID - CNC
  grid(s=[100,100],x=5,y=10,w=2)
  {
    cnc(0.5,$fn=32){
      ellipse([2,1],$fn=32);
      ellipse([1,2],$fn=32);
  }}
*/

/* PIEPART
    piepart(d=10,p=20/100);
    rotate([0,0,360*21/100])
    piepart(d=10,p=78/100);

*/

/* PIE
pie(d=10,p=[1,2,1,2,1,2,3,2,1,3,2,1]);
*/
/* SUM
echo(sum([5,10,15,20]));
*/
/* MYANGLE/HYPOVEC*/
/* CORRECT / CHULL
rotate_extrude()
rotate_extrude_correct()
chull(){
  circle(d=3);
  translate([60,0])
  circle(d=3);
  translate([70,120])
  circle(d=3);
}
*/

/* FRACTSHAPE
    fractshape(d=40,fn=4,maxit=3);
    translate([40,0,0]) fractshape(d=40,fn=5,it=3);
    translate([80,0,0]) fractshape(d=40,fn=6,it=3);

*/
/* clean
test=[[0,0],[0,0],[10,10],[10,10],[20,20],[20,20],[30,30],[30,30],[40,40],[40,40],[50,50],[50,50]];
echo(clean(test));
*/

/* Kochflake
    for(i=[0:3]){
    translate([i*10,0,0])kochflake(d=10,maxit=i);}
    */

/* Chaincurve / TRACE

//points=[[0,0],[sin(30)*10,cos(30)*10],[10,0],[0,0]];

points=[[0,0],[0,10],[10,10],[20,0],[30,10],[40,20],[60,-20],[10,-10],[10,-5],[15,-5],[15,0],[0,0]];

color([0.4,1.0,0.4,1])
linear_extrude(1)
polygon(chaincurve(points,8));

color("red") linear_extrude(3)   
trace(points,0.2);

color([0.5,0.5,1,1]) linear_extrude(3)   
trace(chaincurve(points,8),0.1);


*/
















/*═══════════════════════════════╕
│  Modificateurs / déformations   \
╘════════════════════════════════*/
module outline                (w,t){ 
  w=w==undef?1:w;
  t=t==undef?"on":t;
  difference()
  {    
    offset(t=="out"?w:t=="in"?0:w/2)
    children();
    offset(t=="out"?0:t=="in"?-w:-w/2)
    children();
  }
}

module pythatree              (a,h,sp,m,b,r1,r2,s,d){ 
  a  = a  == undef ? 45  : a; 
  h  = h  == undef ? 1   : h;
  sp = sp == undef ? 0   : sp;
  m  = m  == undef ? 3   : m;
  b  = b  == undef ? 1   : b;
  r1 = r1 == undef ? 0   : r1;
  r2 = r2 == undef ? 0   : r2;
  s  = s  == undef ? py  : s;
  d  = d  == undef ? "y" : d;
  children();
  if(b<=m)
  {
    translate([d=="x"?h:d=="y"?sp:-sp, d=="x"?-sp:d=="y"?h:0, d=="x"?0:d=="y"?0:h])
    rotate([d=="x"?0:d=="y"?r2:0, d=="x"?r2:d=="y"?0:-a, d=="x"?-a:d=="y"?-a:r2])
    scale([s,s,s])
    pythatree(a=a,h=h,sp=sp,m=m,b=b+1,r1=r1,r2=r2,s=s,d=d)
    {
      children();
    };
    translate([d=="x"?h:d=="y"?-sp:sp, d=="x"?sp:d=="y"?h:0, d=="x"?0:d=="y"?0:h])
    rotate([d=="x"?0:d=="y"?r1:0, d=="x"?r1:d=="y"?0:a, d=="x"?a:d=="y"?a:r1])
    scale([s,s,s])
    pythatree(a=a,h=h,sp=sp,m=m,b=b+1,r1=r1,r2=r2,s=s,d=d)
    {
      children();
    };
  }
}
module chull                  (m){ 
  for(i=[0:$children-2]){
    hull(){
      children(m==true?0:i);
      children(i+1);
    }
  }
}

module rotate2                (){
  rotate([45,90-atan(sqrt(2)),0])
  children();
}
module ring                   (d,n){
  d=d==undef?10:d;
  n=n==undef?5:n;
  for(i=[0:n-1]){
    rotate([0,0,360/n*i]){
      translate([d/2,0,0])
      children();
    }
  }
}
module fibo                   (s,n,r){
  r=r==undef?true:r;
  s=s==undef?1:s;
  n=n==undef?128:n;
  

  for(i=[1:n]){
    rotate([0,0,angledor*i])
    translate([s*i,0,0])
    scale(r==true?s+pow(1.003,i):1)
    children();
  }  
}

module skew                   (XY,XZ,YX,YZ,ZX,ZY){  
  matrice=[ 
    [1,XY,XZ,0], //[redimX, skewXY, skewXZ,translateX]
    [YX,1,YZ,0], //[SkewYX,RedimY,SkewYZ,translateY]
    [ZX,ZY,1,0] //[SkewZX, SkewZY,redimZ,TranslateZ]
  ]; 
  multmatrix(matrice){
    children();
  }
}

module cnc                    (d){
  d = d == undef ? 3:d;
  offset(-d/2)
  offset(d/2)
  children();
}

module moebius                (n,d,t){
  n = n == undef ? 128  :n;
  d = d == undef ? 30   :d;
  t = t == undef ? 0.5 :t;
  union(){
    for(i=[1:n]){
      hull(){
        rotate([0,360/n*i,0])
        translate([d/2,0,0])
        rotate([0,0,i*(360*t)/n])
        linear_extrude(0.1)
        children();
  
        rotate([0,360/n*(i+1),0])
        translate([d/2,0,0])
        rotate([0,0,(i+1)*(360*t)/n])
        linear_extrude(0.1)
        children();
      }
    }
  }
}

module grid                   (s,x,y){
  s=s==undef?[100,100]:s;
  x=x==undef?10:x;
  y=y==undef?10:y;
  for(i=[1:x-1])
    translate([i*s[0]/x,0,0])
    rotate([-90,0,0])
    linear_extrude(s[1])
    children();  
  
  for(i=[1:y-1])
    translate([0,i*s[1]/y,0])
    rotate([-90,0,-90])
    linear_extrude(s[0])
    children();  
}

module rotate_extrude_correct (){
  difference(){
    children();
    translate([-100000,-50000])
    square([100000,100000]);
  }
}


/*═══════════════════╕
│  Nouvelles formes   \
╞══════╤═══════════════╛
│  2D  │
╘═════*/
module teardrop (d,a,fn){
  polygon(teardrop(d=d,a=a,fn=fn));
}

module star         (d1,d2,fn){
  polygon(star(d1=d1,d2=d2,fn=fn));
}

module ellipse      (s,fn){
  polygon(ellipse(s,fn));
}
module losange      (table){
  polygon(ellipse(table,fn=4));
}
module roundsquare  (table,d,fn){
  polygon(roundsquare(s=table,d=d,fn=fn));
}
module kochflake    (d,maxit){
  polygon  (
    koch
    (
      ngon(d=d,fn=3),
      maxit=maxit
    )      
  );
}
module ngon         (d,fn,inside){
  polygon(ngon(d,fn,inside));
}



module piepart      (d,a,p){
  polygon(piepart(d=d,a=a,p=p));
}

module triangle     (w,h){ 
  polygon(triangle(w=w,h=h));
}

module fractshape   (d,fn,inside,maxit){
  polygon(fractshape(fn=fn,d=d,maxit=maxit,inside=inside));
}



module lghs         (){  
  for(i=[-1:2:1])
  {
    rotate([0,0,i*45]){
      translate([0,-50,0])
      difference(){
        cnc(10)
        union(){
          hull(){
            circle(d=20);
            translate([0,100,0])
            circle(d=15);
          }
          translate([0,100,0])
          circle(d=50);
        }
        hull(){
          translate([0,150,0])
          rotate([0,0,30])
          circle(d=25,$fn=6);
          translate([0,110,0])
          rotate([0,0,30])
          circle(d=25,$fn=6);
        }
        circle(d=10);
      }
    }
  }
}




module trace        (table,d){
  d=d==undef?1:d;
  for(i=[0:len(table)-2]){
    hull(){
      translate(table[i])
      circle(d=d);
      translate(table[i+1])
      circle(d=d);
    }
    translate(table[i])
    circle(d=d*4);
  }
}



/*════════╕
│  2D/3D  │
╘════════*/

/*═════╕
│  3D  │
╘═════*/
module tube       (d1,d2,h,center){
  d1=d1==undef?10:d1;
  d2=d2==undef?8:d2;
  h=h==undef?30:h;
  center=center==undef?false:center;
  translate([0,0,center==true?-h/2:0])
  difference(){
  cylinder(d=d1,h=h);
  translate([0,0,-1])
  cylinder(d=d2,h=h+2);
  }
}

module coude      (d1,d2,a){
  d1=d1==undef?10:d1;
  d2=d2==undef?8:d2;
  a=a==undef?90:a<=-90?-90:a>=90?90:a;
  difference(){
    union(){
      cylinder(d=d1,h=d1/2);
      translate([0,0,d1/2])
      sphere(d=d1);
      translate([0,0,d1/2])
      rotate([0,a,0])
      cylinder(d=d1,h=d1/2);
    }
    union(){
      translate([0,0,-1])
      cylinder(d=d2,h=d1/2+1);
      translate([0,0,d1/2])
      sphere(d=d2);
      translate([0,0,d1/2])
      rotate([0,a,0])
      cylinder(d=d2,h=d1/2+1);
    }
  }
}

module roundcube  (s,b,t,center){
  s=s==undef?[50,40,30]:s;
  b=b==undef?[5,5,5,5]:b;
  t=t==undef?[20,20,20,20]:t;
  center=center==undef?false:center;
  translate([center==true?-s[0]/2:0,center==true?-s[1]/2:0,center==true?-s[2]/2:0])
  hull()
  {
    translate([b[0]/2,b[0]/2,b[0]/2])
    sphere(d=b[0]);
  
    translate([s[0]-b[1]/2,b[1]/2,b[1]/2])
    sphere(d=b[1]);
  
    translate([s[0]-b[2]/2,s[1]-b[2]/2,b[2]/2])
    sphere(d=b[2]);
  
    translate([b[3]/2,s[1]-b[3]/2,b[3]/2])
    sphere(d=b[3]);
  
    translate([t[0]/2,t[0]/2,s[2]-t[0]/2])
    sphere(d=t[0]);
  
    translate([s[0]-t[1]/2,t[1]/2,s[2]-t[1]/2])
    sphere(d=t[1]);
  
    translate([s[0]-t[2]/2,s[1]-t[2]/2,s[2]-t[2]/2])
    sphere(d=t[2]);
  
    translate([t[3]/2,s[1]-t[3]/2,s[2]-t[3]/2])
    sphere(d=t[3]);
  }
}

module bone       (h,d1,d2,c){ 

  h    = h    == undef ? 50       : h;
  d1   = d1   == undef ? 20       : d1;
  d2   = d2   == undef ? 14.14214 : d2;
  c    = c    == undef ? 40       : c;

  rotate_extrude(){
    rotate_extrude_correct(){
      cnc((c)*2,$fn=128)
      {
        circle(d=d1);
        translate([0,h])
        circle(d=d2);
      }  
    }
  }
}

module pie        (d,p,pct,i=1,a=0){
  pct=topct(p);
  echo(pct);
  rotate([0,0,a*360])
  linear_extrude(i)
  piepart(d=d,p=p[i-1]/sum(p)+0.01);
  if(i<len(p)){
    pie(d=d,p=p,i=i+1,a=a+pct[i-1]);
  }
}
/*══════════════════════╕
│  Nouvelles fonctions   \
╞═══════════════════╤════╛
│  Sur nombres (a)  │
╘══════════════════*/
function random    (n,s,pos)       = rands(pos==undef?0:pos==true?0:-n,n,1,s==undef?n:s)[0];
function fibonacci (n,a=0,b=1,c=1) = c<n?fibonacci(a=b,b=a+b,c=c+1,n=n):a+b;
function hypo      (a,b)           = sqrt((a*a)+(b*b));
function real      (a,b,c)         = ((a*a)+(b*b))+c;
function imaginary (a,b,c)         = (2*a*b)+c;    
function pair      (a)             = a%2==0?true:false;


/*═════════════════════════╕
│  Sur tables [a,b,c, ...] │
╘═════════════════════════*/


function sum     (a,b=0,c=0)       = b<len(a)?sum(a=a,b=b+1,c=c+a[b]):c;
function topct   (a)               = a/sum(a);
function middle  (a,b=0,c=0)       = b<len(a)?sum(a=a,b=b+1,c=c+a[b])/len(a):c;
function invert  (a)               = let(b=[for(i=[0:len(a)-1]) a[(len(a)-1)-i]])b;
function sort    (a,invert=false)  = len(a) == 0 ? [] : let (
      b=floor(len(a)/2),
      c=[for(i=a) if (i<a[b]) i],
      d=[for(i=a) if (i>a[b]) i],
      e=[for(i=a) if (i==a[b]) i]
    ) 
    invert==false?concat(sort(c),e,sort(d)):invert(concat(sort(c),e,sort(d)));

/*════════════════════════════╕
│  Sur vecteurs [[a,b],[c,d]] │
╘════════════════════════════*/
function hypovec        (a,b)           = sqrt(((b[0]-a[0])*(b[0]-a[0]))+((b[1]-a[1])*(b[1]-a[1])));
function divide         (a,b,c)         = [a[0]+(b[0]-a[0])*c, a[1]+(b[1]-a[1])*c];      
function myangle        (a,b)           = atan2(b[0]-a[0],b[1]-a[1]);
function join           (a,c=0,t=[])    = let (u=concat(t,a[c]))c==len(a)?t:join(a=a,c=c+1,t=u);

// NIGHTLY BUILDS ONLY
function join2(aa) = [for(i=[0:len(aa)-1] ) each aa[i]];
function clean(a) = [for(i=[0:len(a)-1]) each (a[i]==a[i+1]?"":a[i][0]==undef?"":[a[i]])];

function koch           (a,angle,maxit,it)       =  let(
    b = [ for ( i = [ 0 : len(a)-2  ] ) [
      a[i],
      divide(a[i],a[i+1],1/3),
      divide(a[i],a[i+1],1/3) + [
        sin(myangle(a[i],a[i+1])-(angle==undef?60:angle<=60?60:angle>=180?180:angle))*hypovec(a[i], a[i+1])/3,
        cos(myangle(a[i],a[i+1])-(angle==undef?60:angle<=60?60:angle>=180?180:angle))*hypovec(a[i],a[i+1])/3],
  
  divide(a[i],a[i+1],2/3)+[sin(-90+myangle(a[i],a[i+1])-((90+(90-(angle<=60?60:angle>=180?180:angle)))))*hypovec(a[i],a[i+1])/3,cos(-90+myangle(a[i],a[i+1])-(90+(90-(angle<=60?60:angle>=180?180:angle))))*hypovec(a[i],a[i+1])/3],
  divide(a[i],a[i+1],2/3),
  a[i+1]
  ]],
  maxit=maxit==undef?0:maxit,
  it=it==undef?0:it
    ) 
  it==maxit?clean(join2(b)):koch(a=clean(join2(b)),angle=angle,maxit=maxit,it=it+1);  

function curve(table,fn) = let(
    fn = fn == undef ? 8 : fn,
    c = [ for ( i = [0:fn] ) each [divide(table[0],table[1],1/fn*i)]],
    d = [ for ( i = [0:fn] ) each [divide(table[1],table[2],1/fn*i)]],
    e = [ for ( i = [0:fn] ) each [divide(c[i],d[i],1/fn*i)]])
  e;

function doublepoints(table,f,it=0) = let(
    f=f==undef?0:f,
    aa = [for (i=[0:len(table)-1]) each [table[i],divide(table[i],table[i+1],1/2)]]
      )
    it==f?clean(aa):doublepoints(clean(aa),f=f,it=it+1);

function ngon(d,fn,inside) = let (  
    d=d==undef?10:inside==undef?d:inside==true?d:d*((d/2)/(cos(360/fn/2)*d/2)),
    fn=fn==undef?4:fn,
    aa=[for(i=[0:fn])[sin(360/fn*i)*d/2,cos(360/fn*i)*d/2]]
    )
  aa;

function square(d,center)=let(
    center=center==undef?false:center,
    d=d==undef?[10,20]:d,
    c1  = center  ==  true ? [-d[0]/2,-d[1]/2]  :  [    0,    0],
    c2  = center  ==  true ? [-d[0]/2, d[1]/2]  :  [    0, d[1]],
    c3  = center  ==  true ? [ d[0]/2, d[1]/2]  :  [ d[0], d[1]],
    c4  = center  ==  true ? [ d[0]/2,-d[1]/2]  :  [ d[0], 0],
    aa=[c1,c2,c3,c4,c1]
  )
  aa;

function ellipse(s,fn) = let (
    fn=fn==undef?16:fn,
    s=s==undef?[10,10*aphi]:s,
    aa=[for(i =[0:fn] ) [sin(360/fn*i)*s[0]/2,cos(360/fn*i)*s[1]/2]]
  )
  aa;

function circle(d,r,fn) = let (
    fn=fn==undef?16:fn,
    r=r==undef?d==undef?5:d/2:r,    
    aa=ngon(d=d,fn=fn)
  )
  aa;

function star(d1,d2,fn) = let (
    d1=d1==undef?10:d1, 
    d2=d2==undef?5:d2,
    fn=fn==undef?7:fn,
    aa=[for(i=[1:2*fn])[sin(360/(2*fn)*i)*(pair(i)==true?d1/2:d2/2),cos(360/(2*fn)*i)*(pair(i)==true?d1/2:d2/2)]]
  )
  aa;

function roundsquare(s,d,fn) = let (
  fn = fn == undef ? 8:fn,
  s = s == undef ? [15,20] : s,
  d = d == undef ? [3,6,3,6] : len(d) == 1 ? [d[0]/2,d[0]/2,d[0]/2,d[0]/2]:len(d)==2?[d[0]/2,d[1]/2,d[1]/2,d[1]/2]:len(d)==3?[d[0]/2,d[1]/2,d[2]/2,d[2]/2]:d[0]==undef?[d/2,d/2,d/2,d/2]:d/2,
  
  p1 = [0,0],
  p2 = [0,d[0]],
  p3 = [0,s[1]-d[1]],
  p4 = [0,s[1]],
  p5 = [d[1],s[1]],
  p6 = [s[0]-d[2],s[1]],
  p7 = [s[0],s[1]],
  p8 = [s[0],s[1]-d[2]],
  p9= [s[0],d[3]],
  p10= [s[0],0],
  p11= [s[0]-d[3],0],
  p12= [d[0],0],

  c1=curve([p3,p4,p5],fn=fn),
  c2=curve([p6,p7,p8],fn=fn),
  c3=curve([p9,p10,p11],fn=fn),
  c4=curve([p12,p1,p2],fn=fn),

  aa=clean(join2([c1,c2,c3,c4,[p3]]))

)

  aa;

function piepart(d,a,p) = let (
  d=d==undef?10:d/2,
  a=a==undef?p==undef?90:p>=1?360*1/p:360*p:a,
  aa=concat([[0,0]],[for(i=[0:a])[-sin(-90+i)*d,cos(-90+i)*d]])
)
  aa;

function triangle(w,h)= let (
  h=h==undef?cos(30)*w:h,
  aa=[[-w/2,0],[0,h],[w/2,0],[-w/2,0]]
)
  aa;

function fract           (a,angle,in,maxit,it)             = let( 
    maxit=maxit==undef?3:maxit==0?1:maxit,
    it=it==undef?0:it,
    angle=angle==undef?60:angle,
  b = [ for ( i = [ 0 : len(a)-2  ] ) [
      a[i],
  
      divide(a[i],a[i+1],angle/90/2),
  
      divide(a[i],a[i+1],1/2)+
        [sin(myangle(a[i],a[i+1]) + (in==false?-90:90)) * hypovec(a[i],a[i+1]) * angle/90/(180/angle),
        cos(myangle(a[i],a[i+1]) + (in==false?-90:90)) * hypovec(a[i],a[i+1]) * angle/90/(180/angle)],
  
      divide(a[i],a[i+1],1-(angle/90/2)),
  
      a[i+1]]
    ]
  ) 
  
  it+1==maxit?clean(join2(b)):fract(a=clean(join2(b)),angle=angle,in=in,maxit=maxit,it=it+1);  

function fractshape(d,fn,inside,maxit)= let(
  d=d==undef?10:d/2,
  fn=fn==undef?5:fn,
  maxit=maxit==undef?3:maxit,
  inside=inside==undef?true:inside,
  angle=fn==3?60:fn==4?89:360/fn,
  points=fract(ngon(d=d*2,fn=fn),maxit=maxit,angle=angle,in=inside)  
)
points;

function teardrop(d,a,fn)=let (
  d=d==undef?10:d,
  a=a==undef?30:a,
  h=d*tan(90-a),
  fn=fn==undef?16:fn,
  courbe= [for(i=[0:fn]) [sin(90-a+(360-(90-a)*2)/fn*i)*d/2,cos(90-a+(360-(90-a)*2)/fn*i)*d/2]],
  aa=concat(courbe,[[0,(cos(90-a)*d/2)+h*sin(90-a)/2]],[[sin(90-a)*d/2,cos(90-a)*d/2]])
)
aa;
  
function chaincurve(table,fn,closed,detail) = let (
  detail=detail==undef?1:detail==0?1:detail*sign(detail),
  closed=closed==undef?true:closed,
  totaltab=concat(table,[table[0]],closed==true?[table[1]]:""),
  tab = doublepoints(totaltab,detail-1),
  a = [for (i=[2:2:len(tab)-2]) each curve([tab[(i)-1],tab[i],tab[i+1]],fn)]
    )
 a;



function fractalize(table,force,maxit,seed)= let ( 
  aa=
    [
      for(i=[0:len(table)-2], ab = doublepoints([[table[i][0],table[i][1]],[table[i+1][0],table[i+1][1]]],f=maxit))
        for(j=ab[0]) each clean([[ab][0],[ab][1]]+[[(random(n=force,s=sin(seed)*sin(ab[0])+sin(ab[1]))),(random(n=force,s=cos(seed)*cos(ab[0])-sin(ab[1])))],[(random(n=force,s=tan(seed)+sin(ab[0])+2*cos(ab[1]))),(random(n=force,s=cos(seed)+cos(ab[0])-3*cos(ab[1])))]])
      
      
    ]
 )
 aa; 


//polygon(fractalize(square([30,10],center=true),maxit=3,force=1,seed=30));
 /* 
polygon(fractalize(ngon(d=10,fn=6),maxit=4,force=0.125,seed=1));
echo(fractalize(ngon(d=10,fn=4),maxit=3,force=0.5,seed=123));
*/





  
/*

         (a,angle,in,maxit,it)             = let( 
    maxit=maxit==undef?3:maxit==0?1:maxit,
    it=it==undef?0:it,
    angle=angle==undef?60:angle,
  b = [ for ( i = [ 0 : len(a)-2  ] ) [
      a[i],
  
      divide(a[i],a[i+1],angle/90/2),
  
      divide(a[i],a[i+1],1/2)+
        [sin(myangle(a[i],a[i+1]) + (in==false?-90:90)) * hypovec(a[i],a[i+1]) * angle/90/(180/angle),
        cos(myangle(a[i],a[i+1]) + (in==false?-90:90)) * hypovec(a[i],a[i+1]) * angle/90/(180/angle)],
  
      divide(a[i],a[i+1],1-(angle/90/2)),
  
      a[i+1]]
    ]
  ) 
  
  it+1==maxit?clean(join2(b)):fract(a=clean(join2(b)),angle=angle,in=in,maxit=maxit,it=it+1); 

*/









 
 
 
 
 
 
 
 
 
 
 
 
 /*
square([10,15],center=true);
 
translate([15,0])   polygon( square([10,15],center=true) );

translate([30,0])   polygon( fractalize(square([10,15],center=true),maxit=3,force=0.5,seed=123 ));
 
translate([0,-20])  polygon( chaincurve(square([10,15],center=true),detail=3 ));

translate([15,-20])  polygon( chaincurve(koch(square([10,15],center=true),maxit=1),detail=2));
 
 */
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 