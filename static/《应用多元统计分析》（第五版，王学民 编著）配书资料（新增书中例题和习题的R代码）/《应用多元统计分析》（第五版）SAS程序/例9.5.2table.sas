proc corresp data=sasuser.examp952table out=results rp cp short;
	var A B C D;
    id response;
run;
