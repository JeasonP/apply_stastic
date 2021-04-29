proc corresp data=sasuser.examp952 out=results rp cp short;
    tables x,y;
    weight f;
/*��SAS9.3�����ϰ汾�У������plot���̿���ʡ��*/
proc plot data=results;
    plot dim1*dim2=_name_ /box vspace=6 hspace=10 haxis=-1.5 to 1.5 by .5 vaxis=-1.5 to 1.5 by .5;
run;
