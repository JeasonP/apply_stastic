proc corresp data=sasuser.exec91table out=results rp cp short;
    var A B C D;
    id income;
run;
