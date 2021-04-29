proc anova data=sasuser.exec410;
    class g;
    model x1 x2=g;
    manova h=g;
run;
