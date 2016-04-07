function res = testPoints(x,y)
    b1 = [x,ones(size(x))]\y;
    res1 = b1(1)*x+b1(2)<y;

    b2 = [x.^2,x,ones(size(x))]\y;
    res2 = b2(1)*x.^2+b2(2)*x+b2(3)-y>0;

    res3 = res1.*res2;
    res4 = res1.*(1-res2);
    res5 = (1-res1).*res2;
    res6 = (1-res1).*(1-res2);
    res = res3 * 1 + res4 * 2+ res5 * 3+ res6 * 4;
end
