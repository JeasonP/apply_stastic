/*����˵����ֻ�漰����δ˵���Ĳ��֣���(type=cov)�������������ݼ�ΪЭ�������*/
data examp722(type=cov);
    input _name_$  x1-x3;
    cards;
x1     16    .      .
x2      2    1      .
x3     30    4    100
;
proc princomp cov;
    var x1-x3;
proc princomp;
    var x1-x3;
run;



