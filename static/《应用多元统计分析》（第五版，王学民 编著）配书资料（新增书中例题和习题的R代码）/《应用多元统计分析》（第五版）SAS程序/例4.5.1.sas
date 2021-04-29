proc anova data=sasuser.examp451;
	class g;
	model x1-x4=g;
	manova h=g;
/*剔除丁商品后再对其他三种商品进行三元方差分析检验*/
proc anova data=sasuser.examp451;
	class g;
	model x1-x3=g;
	manova h=g;
run;
