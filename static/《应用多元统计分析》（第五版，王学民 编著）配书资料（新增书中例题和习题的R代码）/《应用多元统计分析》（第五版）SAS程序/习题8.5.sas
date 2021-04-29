proc factor data=sasuser.exec85 n=2 rotate=varimax;
    var x1-x5;
proc factor data=sasuser.exec85 n=2 priors=smc preplot rotate=varimax plot out=out85;
    var x1-x5;
proc factor data=sasuser.exec85 n=2 method=ml heywood rotate=varimax;
    var x1-x5;
proc plot;
    plot factor2*factor1=i;
run;
