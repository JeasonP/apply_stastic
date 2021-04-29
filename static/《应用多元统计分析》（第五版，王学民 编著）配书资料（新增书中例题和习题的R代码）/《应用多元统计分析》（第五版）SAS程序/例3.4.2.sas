proc corr data=sasuser.examp342 cov;
proc corr data=sasuser.examp342 nosimple cov;
	with x3 x4;
	partial x1 x2;
run;
