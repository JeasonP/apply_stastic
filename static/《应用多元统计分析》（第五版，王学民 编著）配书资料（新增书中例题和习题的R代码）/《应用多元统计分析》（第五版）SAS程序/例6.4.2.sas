proc standard data=sasuser.examp633 mean=0 std=1 out=stan;
proc fastclus data=stan maxc=5 drift list;
    id region;
run;
