data examp637(type=distance);
    array x(8) x1-x8;
    input  v $ x1-x8;
    do i=1 to 8;
      x(i)=1-x(i);
    end;
    drop i;
    cards;
x1 1.000  .     .     .     .     .     .     .
x2  .846 1.000  .     .     .     .     .     .
x3  .805  .881 1.000  .     .     .     .     .
x4  .859  .826  .801 1.000  .     .     .     .
x5  .473  .376  .380  .436 1.000  .     .     .
x6  .398  .326  .319  .329  .762 1.000  .     .
x7  .301  .277  .237  .327  .730  .583 1.000  .
x8  .382  .415  .345  .365  .629  .577  .539 1.000
;
/*在SAS9.3及以上版本中，下面的tree过程都可以省略*/
proc print data=examp637;
proc cluster data=examp637 method=sin;
   	var x1-x8;
   	id  v;
proc tree horizontal;
    id  v;
proc cluster data=examp637 method=com;
   	var x1-x8;
   	id  v;
proc tree horizontal;
    id  v;
proc cluster data=examp637 method=ave nosquare;
   	var x1-x8;
   	id  v;
proc tree horizontal;
    id  v;
run;
