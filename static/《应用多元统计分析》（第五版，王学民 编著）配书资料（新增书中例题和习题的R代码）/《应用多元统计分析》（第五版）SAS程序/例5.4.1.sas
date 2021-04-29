proc candisc data=sasuser.examp541 out=outcan;
	class g;
proc plot;
	plot can2*can1=g;
run;
