proc factor data=sasuser.examp844 n=3 rotate=varimax out=out844;
    var x1-x10;
proc factor data=sasuser.examp844 n=4 rotate=varimax;
    var x1-x10;
run;
