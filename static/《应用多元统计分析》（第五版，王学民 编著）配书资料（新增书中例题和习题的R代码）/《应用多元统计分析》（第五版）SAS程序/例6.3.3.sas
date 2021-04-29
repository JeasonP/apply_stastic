/*在SAS9.3及以上版本中，下面的tree过程都可以省略*/
proc cluster data=sasuser.examp633 method=sin std pseudo;
    id region;
proc tree horizontal;
    id region;
proc cluster data=sasuser.examp633 method=cen std pseudo;
    id region;
proc tree horizontal;
    id region;
proc cluster data=sasuser.examp633 method=war std notie pseudo;
    id region;
proc tree horizontal;
    id region;
run;
