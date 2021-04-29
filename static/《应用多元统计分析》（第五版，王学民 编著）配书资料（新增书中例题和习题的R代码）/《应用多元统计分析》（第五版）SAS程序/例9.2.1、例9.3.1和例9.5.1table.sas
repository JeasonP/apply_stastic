proc corresp data=sasuser.examp921table out=results rp cp short;
    var A B C D E;
    id mental;
/*在SAS9.3及以上版本中，下面的plot过程可以省略*/
proc plot data=results;
    plot dim1*dim2=mental /box vspace=6 hspace=13 haxis=-.30 to .30 by .15 vaxis=-.30 to .30 by .15;
run;
