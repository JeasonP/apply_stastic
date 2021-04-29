proc iml;
    S1={294.76 -0.60  -32.57,
         -0.60  0.0013  0.073,
        -32.57  0.073   4.23};
    S2={1596.18 -1.19  -91.05,
          -1.19  0.001   0.071,
         -91.05  0.071   5.76};
    S3={182.67 -0.42  -22.00,
         -0.42  0.0012  0.056,
        -22.00  0.056   3.14};
    Sp=(S1+S2+S3)/3;
    detS1=det(S1);
    detS2=det(S2);
    detS3=det(S3);
    detSp=det(Sp);
    lndetS1=log(detS1);
    lndetS2=log(detS2);   
    lndetS3=log(detS3);
    lndetSp=log(detSp);
    M=225*lndetSp-75*(lndetS1+lndetS2+lndetS3);
    c=26/6/225;
    u=(1-c)*M;
print detS1 detS2 detS3 detSp lndetS1 lndetS2 lndetS3 lndetSp M u;
