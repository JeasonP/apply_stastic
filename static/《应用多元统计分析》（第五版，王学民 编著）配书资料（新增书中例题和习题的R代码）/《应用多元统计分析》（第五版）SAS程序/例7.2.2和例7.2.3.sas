/*程序说明（只涉及书中未说明的部分）：(type=cov)表明建立的数据集为协方差矩阵*/
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



