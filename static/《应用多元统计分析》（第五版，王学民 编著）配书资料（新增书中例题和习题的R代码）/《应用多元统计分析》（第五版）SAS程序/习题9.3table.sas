proc corresp data=sasuser.exec93table out=results rp cp short; 
    var y1973-y1978; 
    id science;
run;
