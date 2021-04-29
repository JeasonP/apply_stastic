proc iml;
    a={16 -4 3,-4 4 -2, 3 -2 9};
    b=block(4,2,3);
    R=inv(b)*a*inv(b);
print R;
