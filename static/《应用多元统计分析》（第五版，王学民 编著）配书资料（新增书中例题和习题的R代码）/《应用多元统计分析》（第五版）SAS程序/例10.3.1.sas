proc cancorr data=sasuser.examp1031 vprefix=u  wprefix=v;
    var x1-x3;
    with y1-y3;
run;
