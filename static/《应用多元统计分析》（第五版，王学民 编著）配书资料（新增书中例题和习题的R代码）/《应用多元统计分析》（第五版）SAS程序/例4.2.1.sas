proc corr data=sasuser.examp421 cov;
/*下面程序中的x和S分别表示样本均值和样本协差阵，它们均可通过运行上述程序（或通过交互式数据分析菜单系统）获得，mu0表示检验值*/
proc iml;
	x={82,60.2,14.5};
	mu0={90,58,16};
	S={31.6 8.04 0.5,
	   8.04 3.172 1.31,
	   0.5 1.31 1.9};
	T2=6*t(x-mu0)*inv(S)*(x-mu0);
print T2;
