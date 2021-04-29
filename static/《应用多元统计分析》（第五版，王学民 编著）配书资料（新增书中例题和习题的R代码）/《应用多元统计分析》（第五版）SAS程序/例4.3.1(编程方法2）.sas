proc glm data=sasuser.examp431;
	class sex;
	model x1-x3=sex;
	manova h=sex;
run;
