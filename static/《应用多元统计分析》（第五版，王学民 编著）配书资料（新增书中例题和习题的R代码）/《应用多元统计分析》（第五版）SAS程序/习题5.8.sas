proc candisc data=sasuser.exec58 out=outcan;
	class g;
proc plot;
	plot can2*can1=g;
run;
