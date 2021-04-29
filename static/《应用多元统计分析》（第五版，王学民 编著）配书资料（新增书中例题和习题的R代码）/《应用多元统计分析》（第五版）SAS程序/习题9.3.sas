proc corresp data=sasuser.exec93 out=results rp cp short;
    tables row,column;
    weight f;
run;
