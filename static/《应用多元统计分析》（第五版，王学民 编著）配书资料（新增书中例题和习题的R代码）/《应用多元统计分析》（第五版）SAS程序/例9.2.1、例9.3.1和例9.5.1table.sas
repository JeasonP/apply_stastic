proc corresp data=sasuser.examp921table out=results rp cp short;
    var A B C D E;
    id mental;
/*��SAS9.3�����ϰ汾�У������plot���̿���ʡ��*/
proc plot data=results;
    plot dim1*dim2=mental /box vspace=6 hspace=13 haxis=-.30 to .30 by .15 vaxis=-.30 to .30 by .15;
run;
