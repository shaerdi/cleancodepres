function res = testPoints(x,y)

    A = [x,ones(size(x))];
    b1 = A\y;
    res1 = b1(1)*x+b1(2) -y >0;

    A = [x.^2,x,ones(size(x))];
    b2 = A\y;
    res2 = b2(1)*x.^2+b2(2)*x+b2(3)-y>0;

    plot(x(res1.*res2),y(res1.*res2),'r.')
    plot(x(res1.*(1-res2)),y(res1.*(1-res2)),'b.')
    plot(x((1-res1).*res2),y((1-res1).*res2),'g.')
    plot(x((1-res1).*(1-res2)),y((1-res1).*(1-res2)),'k.')

    xf = linspace(min(x),max(x));
    %todo: plot
end
