proc corresp data=sasuser.exec92 out=results rp cp short;
    tables row,column;
    weight f;
run;
