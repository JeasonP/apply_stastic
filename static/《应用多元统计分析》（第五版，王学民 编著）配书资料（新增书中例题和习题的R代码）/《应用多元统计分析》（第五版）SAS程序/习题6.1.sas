/*��SAS9.3�����ϰ汾�У����µ�tree���̶�����ʡ��*/
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
