proc factor data=sasuser.exec86 n=5 rotate=varimax out=out86;
    var x1-x15;
proc factor data=sasuser.exec86 n=5 priors=smc rotate=varimax;
    var x1-x15;
proc factor data=sasuser.exec86 n=5 method=ml heywood rotate=varimax;
    var x1-x15;
run;
