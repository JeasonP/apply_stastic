/*����˵����ֻ�漰����δ˵���Ĳ��֣���(type=corr)�������������ݼ�Ϊ��ؾ���*/
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
