proc candisc data=sasuser.examp633disc3 out=outcan3;
    class g;
proc plot;
    plot can2*can1=g;
proc candisc data=sasuser.examp633disc5 out=outcan5;
    class g;
proc plot;
    plot can2*can1=g;
run;
