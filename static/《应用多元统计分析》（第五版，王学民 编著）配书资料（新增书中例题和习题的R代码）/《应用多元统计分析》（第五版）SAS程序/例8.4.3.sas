/*程序说明（只涉及书中未说明的部分）：(type=corr)表明建立的数据集为相关矩阵；label语句对变量给出标签*/
data examp843(type=corr);
	input x1-x8;
	label x1='身高' 	x2='手臂长'	x3='上肢长'	x4='下肢长' x5='体重' x6='颈围' x7='胸围' x8='胸宽';
    cards;
1.000  .     .     .     .     .     .     .
 .846 1.000  .     .     .     .     .     .
 .805  .881 1.000  .     .     .     .     .
 .859  .826  .801 1.000  .     .     .     .
 .473  .376  .380  .436 1.000  .     .     .
 .398  .326  .319  .329  .762 1.000  .     .
 .301  .277  .237  .327  .730  .583 1.000  .
 .382  .415  .345  .365  .629  .577  .539 1.000
;
proc factor data=examp843 n=2 rotate=varimax preplot plot;
proc factor data=examp843 n=2 priors=smc rotate=varimax;
proc factor data=examp843 n=2 method=ml heywood rotate=varimax;
run;
