proc factor data=sasuser.exec65 n=2 rotate=varimax preplot plot out=out831;
proc factor data=sasuser.exec65 n=2 priors=smc rotate=varimax;
proc factor data=sasuser.exec65 n=2 method=ml heywood rotate=varimax;
proc plot;
    plot factor2*factor1=alphabet;
run;
