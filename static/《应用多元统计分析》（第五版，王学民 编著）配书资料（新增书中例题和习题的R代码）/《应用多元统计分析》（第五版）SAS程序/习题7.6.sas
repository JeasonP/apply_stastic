proc princomp data=sasuser.exec76 out=prin;
    var x1-x7;

proc sort;
    by prin1;
proc print;
    id state;
    var prin1 prin2;
proc sort;
    by prin2;
proc print;
    id state;
    var prin1 prin2;

proc plot;
    plot prin2*prin1=state;
run;
