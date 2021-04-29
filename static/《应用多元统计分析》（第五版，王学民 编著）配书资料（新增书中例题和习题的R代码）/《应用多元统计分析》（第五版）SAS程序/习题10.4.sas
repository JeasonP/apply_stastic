/*程序说明（只涉及书中未说明的部分）：(type=corr)表明建立的数据集为相关矩阵*/
data exec104(type=corr);
    input x1-x4 y1-y8;
    cards;
1.000  0.785  0.810  0.775  0.086  0.144  0.140  0.222  0.101  0.189  0.199  0.239
0.785  1.000  0.816  0.813  0.200  0.119  0.211  0.301  0.223  0.221  0.274  0.235
0.810  0.816  1.000  0.845  0.041  0.060  0.126  0.120  0.039  0.108  0.139  0.100
0.775  0.813  0.845  1.000  0.228  0.122  0.277  0.214  0.201  0.156  0.271  0.171
0.086  0.200  0.041  0.228  1.000  0.562  0.457  0.579  0.802  0.595  0.512  0.492
0.144  0.119  0.060  0.122  0.562  1.000  0.360  0.705  0.578  0.796  0.413  0.739
0.140  0.211  0.126  0.277  0.457  0.360  1.000  0.273  0.606  0.337  0.798  0.240
0.222  0.301  0.120  0.214  0.579  0.705  0.273  1.000  0.594  0.725  0.364  0.711
0.101  0.223  0.039  0.201  0.802  0.578  0.606  0.594  1.000  0.605  0.698  0.605
0.189  0.221  0.108  0.156  0.595  0.796  0.337  0.725  0.605  1.000  0.428  0.697
0.199  0.274  0.139  0.271  0.512  0.413  0.798  0.364  0.698  0.428  1.000  0.394
0.239  0.235  0.100  0.171  0.492  0.739  0.240  0.711  0.605  0.697  0.394  1.000
;
proc cancorr  vprefix=u  wprefix=v;
    var x1-x4;
    with y1-y8;
run;
