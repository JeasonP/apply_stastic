proc anova data=sasuser.examp451;
	class g;
	model x1-x4=g;
	manova h=g;
/*�޳�����Ʒ���ٶ�����������Ʒ������Ԫ�����������*/
proc anova data=sasuser.examp451;
	class g;
	model x1-x3=g;
	manova h=g;
run;
