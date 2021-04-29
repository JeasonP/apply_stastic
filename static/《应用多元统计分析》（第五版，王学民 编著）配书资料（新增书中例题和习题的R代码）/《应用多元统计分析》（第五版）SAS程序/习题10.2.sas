/*程序说明（只涉及书中未说明的部分）：(type=corr)表明建立的数据集为相关矩阵*/
data exec102(type=corr);
    input _name_$ x1 x2 y1 y2;
    cards;
x1 1       .       .       .
x2 0.6328  1       .       .
y1 0.2412 -0.0553  1       .
y2 0.0586  0.0655  0.4248  1
;
proc cancorr  vprefix=u  wprefix=v;
    var x1 x2;
    with y1 y2;
run;
