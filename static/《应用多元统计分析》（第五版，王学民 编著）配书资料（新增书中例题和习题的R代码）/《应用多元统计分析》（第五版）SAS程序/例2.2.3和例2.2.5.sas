proc iml;
	A={2 -1 4,0 1 -1,1 3 -2};
	E={5,-2,7};
	V={4 1 2,1 9 -3,2 -3 25};
	D=block(2,3,5);
	y的均值=A*E;
	y的协差阵=A*V*t(A);
	x的相关阵=inv(D)*V*inv(D);
print y的均值 y的协差阵 x的相关阵;
