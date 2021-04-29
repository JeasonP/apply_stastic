proc corresp data=sasuser.exec92table out=results rp cp short;
	var A B C D;
    id site;
run;
