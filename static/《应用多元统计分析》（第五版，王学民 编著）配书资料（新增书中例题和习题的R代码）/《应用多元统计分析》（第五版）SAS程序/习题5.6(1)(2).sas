/*����˵����ֻ�漰����δ˵���Ĳ��֣�����data=��ָ�������������ݼ������ﰴ�佨���б��������򣬡�testdata=��ָ����������Ʒ��������ݼ�����testlist��Ҫ���г�����������Ʒ�ķ�����*/
proc discrim data=sasuser.exec56 testdata=sasuser.exec56a crosslisterr testlist;
    class g;
proc discrim data=sasuser.exec56 testdata=sasuser.exec56a pool=no crosslisterr testlist;
    class g;
run;
