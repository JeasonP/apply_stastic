proc anova data=sasuser.exec42;
    class g;
    model x1-x3=g;
    manova h=g;
run;
