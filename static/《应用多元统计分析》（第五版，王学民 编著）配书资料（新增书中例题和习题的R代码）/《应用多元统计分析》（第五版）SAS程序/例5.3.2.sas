/*����˵����ֻ�漰����δ˵���Ĳ��֣�����data=��ָ�������������ݼ������ﰴ�佨���б��������򣬡�testdata=��ָ����������Ʒ��������ݼ�����testlist��Ҫ���г�����������Ʒ�ķ�����*/
proc discrim data=sasuser.examp523  testdata=sasuser.examp532 testlist;
    priors "1"=0.1 "2"=0.9; 
    class g;
    var x1-x4;
run;
