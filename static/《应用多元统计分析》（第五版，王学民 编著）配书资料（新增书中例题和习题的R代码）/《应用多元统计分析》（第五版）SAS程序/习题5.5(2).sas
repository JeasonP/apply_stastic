/*����˵����ֻ�漰����δ˵���Ĳ��֣�����data=��ָ�������������ݼ������ﰴ�佨���б��������򣬡�testdata=��ָ����������Ʒ��������ݼ�����testlist��Ҫ���г�����������Ʒ�ķ�����*/
proc discrim data=sasuser.exec55 testdata=sasuser.exec55a testlist;
    class g;
    priors '1'=0.3 '2'=0.7;
    var x1 x2;
run;
