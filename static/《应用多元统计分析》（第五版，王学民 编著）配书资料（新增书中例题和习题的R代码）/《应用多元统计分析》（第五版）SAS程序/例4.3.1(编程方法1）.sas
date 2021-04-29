proc discrim data=sasuser.examp431  outstat=examp431out;
	class sex;
	var x1-x3;
/*��������е�������ֵx��y�Լ�����Э����Sp���ɴ�����������������ݼ�examp431out�л��,T2��F����������һ*/
proc iml;
	x={82,60.2,14.5};
	y={76,58.4,13.5};
	Sp={27.2308 6.5615 2.8462,6.5615 2.4323 1.4,2.8462 1.4 1.8462};
	T2=6*9/(6+9)*t(x-y)*inv(Sp)*(x-y);
	F=11/(3*13)*T2;
print T2 F;
