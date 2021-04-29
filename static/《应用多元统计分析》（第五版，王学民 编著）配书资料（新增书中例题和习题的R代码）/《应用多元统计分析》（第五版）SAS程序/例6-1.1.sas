data mileages(type=distance); 
	input (atlanta chicago denver houston losangeles miami newyork sanfran seattle washdc) (5.)@55 city $8.; 
    datalines; 
   0                                                  亚特兰大 
 587    0                                             芝加哥 
1212  920    0                                        丹佛 
 701  940  879    0                                   休斯顿 
1936 1745  831 1374    0                              洛杉矶 
 604 1188 1726  968 2339    0                         迈阿密 
 748  713 1631 1420 2451 1092    0                    纽约 
2139 1858  949 1645  347 2594 2571    0               旧金山 
2182 1737 1021 1891  959 2734 2408  678    0          西雅图 
 543  597 1494 1220 2300  923  205 2442 2329    0     华盛顿 
; 
/*在SAS9.3及以上版本中，下面的tree过程都可以省略*/
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
