/*����˵����ֻ�漰����δ˵���Ĳ��֣�����seed=��ָ��һ��������ʼ���۵�����ݼ������ȱʡ����ʼ���۵�ӡ�data=��ָ�������ݼ���ѡ��*/
proc fastclus data=sasuser.examp631 seed=sasuser.examp641seed maxc=2 drift list;
    var x;
    id x;
run;
