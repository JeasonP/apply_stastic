proc iml;
	Sp={0.606  0.262  0.066  0.161,
	    0.262  0.637  0.173  0.143,
	    0.066  0.173  0.810  0.029,
	    0.161  0.143  0.029  0.306};
	x={6.833,7.033,3.967,4.700};
	y={6.633,7.000,4.000,4.533};
	C={1 -1  0  0,
	   0  1 -1  0,
	   0  0  1 -1};
	e={1,1,1,1};
	第一小题T2=15*t(x-y)*t(C)*inv(C*Sp*t(C))*C*(x-y);
	第二小题T2=15*t(e)*(x-y)*inv(t(e)*Sp*e)*t(e)*(x-y);
print 第一小题T2 第二小题T2;
