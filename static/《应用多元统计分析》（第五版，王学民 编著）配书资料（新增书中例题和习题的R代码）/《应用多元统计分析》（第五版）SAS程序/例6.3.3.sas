/*��SAS9.3�����ϰ汾�У������tree���̶�����ʡ��*/
proc cluster data=sasuser.examp633 method=sin std pseudo;
    id region;
proc tree horizontal;
    id region;
proc cluster data=sasuser.examp633 method=cen std pseudo;
    id region;
proc tree horizontal;
    id region;
proc cluster data=sasuser.examp633 method=war std notie pseudo;
    id region;
proc tree horizontal;
    id region;
run;
