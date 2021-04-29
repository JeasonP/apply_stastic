data mileages(type=distance); 
	input (atlanta chicago denver houston losangeles miami newyork sanfran seattle washdc) (5.)@55 city $8.; 
    datalines; 
   0                                                  �������� 
 587    0                                             ֥�Ӹ� 
1212  920    0                                        ���� 
 701  940  879    0                                   ��˹�� 
1936 1745  831 1374    0                              ��ɼ� 
 604 1188 1726  968 2339    0                         ������ 
 748  713 1631 1420 2451 1092    0                    ŦԼ 
2139 1858  949 1645  347 2594 2571    0               �ɽ�ɽ 
2182 1737 1021 1891  959 2734 2408  678    0          ����ͼ 
 543  597 1494 1220 2300  923  205 2442 2329    0     ��ʢ�� 
; 
/*��SAS9.3�����ϰ汾�У������tree���̶�����ʡ��*/
proc cluster data=mileages method=sin; 
	id city; 
 
proc tree horizontal; 
	id city; 
proc cluster data=mileages method=ave nosquare; 
	id city; 

proc tree horizontal; 
	id city; 
 
proc cluster data=mileages method=cen; 
	id city; 
 
proc tree horizontal; 
	id city; 

proc cluster data=mileages method=war; 
	id city; 
 
proc tree horizontal; 
	id city; 
run; 
