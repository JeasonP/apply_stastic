/*程序说明（只涉及书中未说明的部分）：“seed=”指定一个包括初始凝聚点的数据集，如果缺省，初始凝聚点从“data=”指定的数据集中选择*/
proc fastclus data=sasuser.examp631 seed=sasuser.examp641seed maxc=2 drift list;
    var x;
    id x;
run;
