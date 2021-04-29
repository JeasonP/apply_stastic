/*程序说明（只涉及书中未说明的部分）：“data=”指定欲分析的数据集，这里按其建立判别函数及规则，“testdata=”指定欲对其样品分组的数据集，“testlist”要求列出其中所有样品的分组结果*/
proc discrim data=sasuser.exec56 testdata=sasuser.exec56a crosslisterr testlist;
	class g;
	priors '1'=0.8 '2'=0.2; 
run;
