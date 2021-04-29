/*在SAS9.3及以上版本中，下面的tree过程都可以省略*/
proc cluster data=sasuser.exec65 method=ave std;
    id nation;
proc tree horizontal;
    id nation;
proc cluster data=sasuser.exec65 method=war std;
    id nation;
proc tree horizontal;
    id nation;
proc standand data=sasuser.exec65 mean=0 std=1 out=stan;
proc fastclus data=stan maxc=5 drift list;
    var x1-x8;
    id nation;
run;
