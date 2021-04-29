proc fastclus data=sasuser.examp633 maxc=5 drift list;
    var x1-x8;
    id region;
run;
