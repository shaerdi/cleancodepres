function res = testPoints(x,y)
    A = [x,ones(size(x))];
    b1 = A\y;
    res1 = b1(1)*x+b1(2)-y<0;

    A = [x.^2,x,ones(size(x))];
    b2 = A\y;
    res2 = b2(1)*x.^2+b2(2)*x+b2(3)-y<0;
    figure()
    plot(x(res1 & res2),y(res1 & res2),'r.')
    hold on
    plot(x(res1 & ~res2),y(res1 & ~res2),'b.')
    plot(x(~res1 & res2),y(~res1 & res2),'g.')
    plot(x(~res1 & ~res2),y(~res1 & ~res2),'c.')
    
    a = axis();
    xf = linspace(a(1),a(2));
    plot(xf,b1(1)*xf+b1(2),'k')
    plot(xf,b2(1)*xf.^2+b2(2)*xf+b2(3),'k')
    
    res(res1 & res2) = 1;
    res(res1 & ~res2) = 2;
    res(~res1 & res2) = 3; 
    res(~res1 & ~res2) = 4;
end