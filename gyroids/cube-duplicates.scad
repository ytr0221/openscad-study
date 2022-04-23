range = 360; //Range. 360 is one "section".
res = 6; //Resolution.  Range/resolution=cubes on a side
reps = 0; //Repetitions.  0 is just one, 1 is two in every direction, etc.
num=0;

for(a=[0:reps], b=[0:reps], c=[0:reps]) translate([(range/res * a), (range/res * b), (range/res * c)]) {

    for(i=[0:res:range], j=[0:res:range], k=[0:res:range]){
        assign(num = ((cos(i) * sin(j)) + (cos(j) * sin(k)) + (cos(k) * sin(i)))) {
            if ((num < 0.2) && (num > -0.2)) {
                translate([(i/res),(j/res),(k/res)]) 
                    cube([1.05,1.05,1.05]); 
            }
        }
    }
}