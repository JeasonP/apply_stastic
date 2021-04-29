proc iml;
	mean1={4,2};
	mean2={3,-1};
	Sp={6.5 1.1,1.1 8.4};
	mean=(mean1+mean2)/2;
	a=inv(Sp)*(mean1-mean2);
	x0={2,1};
	w=t(a)*(x0-mean);
print mean a w;
