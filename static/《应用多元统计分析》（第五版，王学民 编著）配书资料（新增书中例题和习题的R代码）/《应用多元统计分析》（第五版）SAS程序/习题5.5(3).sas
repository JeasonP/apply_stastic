proc discrim data=sasuser.exec55  outstat=exec55out;
	class g;
    var x1 x2;
/*下面程序中的第1组样本均值x,第2组样本均值y,联合样本协差阵Sp均可从上述程序产生的数据集exec55out中获得*/
proc iml;
	mean1={0.92,2.10};
	mean2={-0.38,8.85};
	mean=(mean1+mean2)/2;
	Sp={23.5529 3.0133,3.0133 39.1158};
	a=inv(Sp)*(mean1-mean2);
	x0={0.6,3.0};
	w=t(a)*(x0-mean);
	threshold=log(0.7/(3*0.3));
print a mean w threshold;
