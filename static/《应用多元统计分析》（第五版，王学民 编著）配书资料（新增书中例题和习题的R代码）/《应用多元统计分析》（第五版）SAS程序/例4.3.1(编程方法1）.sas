proc discrim data=sasuser.examp431  outstat=examp431out;
	class sex;
	var x1-x3;
/*下面程序中的样本均值x和y以及联合协差阵Sp均可从上述程序产生的数据集examp431out中获得,T2和F可以任求其一*/
proc iml;
	x={82,60.2,14.5};
	y={76,58.4,13.5};
	Sp={27.2308 6.5615 2.8462,6.5615 2.4323 1.4,2.8462 1.4 1.8462};
	T2=6*9/(6+9)*t(x-y)*inv(Sp)*(x-y);
	F=11/(3*13)*T2;
print T2 F;
