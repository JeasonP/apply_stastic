/*在SAS9.3及以上版本中，以下的tree过程都可以省略*/
proc cluster data=sasuser.examp631 method=com;
	var x;
	id x;
proc tree horizontal;
proc cluster data=sasuser.examp631 method=med;
	var x;
	id x;
proc tree horizontal;
proc cluster data=sasuser.examp631 method=ave nosquare;
	var x;
	id x;
proc tree horizontal;
proc cluster data=sasuser.examp631 method=cen;
	var x;
	id x;
proc tree horizontal;
run;
