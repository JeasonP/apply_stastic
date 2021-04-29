proc corresp data=sasuser.exec91 out=results rp cp short;
    tables row,column;
    weight f;
run;
