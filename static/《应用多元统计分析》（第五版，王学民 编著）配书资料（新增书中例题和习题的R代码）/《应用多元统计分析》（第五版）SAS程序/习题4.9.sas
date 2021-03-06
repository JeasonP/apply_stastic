proc iml;
    x1={441.16,0.13,-3.36};
    x2={505.97,0.09,-4.57};
    x3={432.51,0.14,-3.31};
    S1={294.76 -0.60  -32.57,
         -0.60  0.0013  0.073,
        -32.57  0.073   4.23};
    S2={1596.18 -1.19  -91.05,
          -1.19  0.001   0.071,
         -91.05  0.071   5.76};
    S3={182.67 -0.42  -22.00,
         -0.42  0.0012  0.056,
        -22.00  0.056   3.14};
    mean=(x1+x2+x3)/3;
    E=75*(s1+s2+s3);
    H=76*((x1-mean)*t(x1-mean)+(x2-mean)*t(x2-mean)+(x3-mean)*t(x3-mean));
    Lamda=det(E)/det(E+H);
    F=(225-3+1)*(1-sqrt(Lamda))	/3/sqrt(Lamda);
print mean E H Lamda F;
