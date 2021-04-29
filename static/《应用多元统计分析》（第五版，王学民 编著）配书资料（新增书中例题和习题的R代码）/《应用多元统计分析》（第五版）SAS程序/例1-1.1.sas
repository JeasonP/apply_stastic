proc iml;
	X={1 2 3 4 5,
	   2 4 7 8 9,
       3 7 10 15 20,
       4 8 15 30 20,
       5 9 20 20 40};
	逆矩阵=inv(X);
	特征值=eigval(X);
	特征向量=eigvec(X);
	行列式=det(X);
	迹=trace(X);
print 逆矩阵 特征值 特征向量 行列式 迹;
