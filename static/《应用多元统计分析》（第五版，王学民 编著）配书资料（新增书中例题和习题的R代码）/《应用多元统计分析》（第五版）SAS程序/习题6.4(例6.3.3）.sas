/*��SAS9.3�����ϰ汾�У������tree���̶�����ʡ��*/
proc cluster data=sasuser.examp633 method=sin pseudo;
    id region;
proc tree horizontal;
    id region;
proc cluster data=sasuser.examp633 method=cen pseudo;
    id region;
proc tree horizontal;
    id region;
proc cluster data=sasuser.examp633 method=war notie pseudo;
    id region;
proc tree horizontal;
    id region;
run;
