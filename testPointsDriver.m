x = linspace(0,1,100);
r = 0.1;
r1  = r *rand(size(x));
r2  = r *rand(size(x));
m = 1;q = 0.1;
a=1;b=-.4;c=0;
y = mean([ r1+a*x.^2+b*x+c;r2+ m*x+q],1);
close all
plot(x,y);
res1 = testPoints(x(:),y(:));
res2 = testPoints2(x(:),y(:));

max(res1-res2)