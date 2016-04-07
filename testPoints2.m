function res = testPoints2(x,y)
    lineFunction = fitLine(x,y);
    parabolaFunction = fitParabola(x,y);
    
    pIsAboveLine = y > lineFunction(x);
    pIsAboveParabola = y > parabolaFunction(x);
    
    aboveBoth = pIsAboveLine & pIsAboveParabola;
    onlyAboveLine = pIsAboveLine & ~pIsAboveParabola;
    onlyAboveParabola = ~pIsAboveLine & pIsAboveParabola;
    belowBoth = ~pIsAboveLine & ~pIsAboveParabola;
    
    res(aboveBoth) = 1;
    res(onlyAboveLine) = 2;
    res(onlyAboveParabola) = 3;
    res(belowBoth) = 4;
    
    figure();hold on;
    plotPoints(x,y,res,'rbgc')
    
    plotLimit = [min(x),max(x)];
    plotFunction(lineFunction, plotLimit);
    plotFunction(parabolaFunction, plotLimit);
       
end

function lineFunction = fitLine(pointsX,pointsY)
    leastSquaresMatrix = [pointsX, ones(size(pointsX))];
    leastSquaresRHS = pointsY;
    lineParam = leastSquaresMatrix \ leastSquaresRHS;
    lineFunction = @(x) lineParam(1) * x + lineParam(2);
end

function parabolaFunction = fitParabola(pointsX,pointsY)
    leastSquaresMatrix = [pointsX.^2,pointsX,ones(size(pointsX))];
    leastSquaresRHS = pointsY;
    parabolaParam = leastSquaresMatrix \ leastSquaresRHS;
    parabolaFunction =  ...
        @(x) parabolaParam(1)*x.^2 + parabolaParam(2)*x + parabolaParam(3);
end

function plotPoints(x,y,res,colors)
    for i = res
        index = res==i;
        plot(x(index),y(index),'.','color',colors(i))
    end
end

function plotFunction(fun,limit)
    x = linspace(limit(1),limit(2));
    plot(x,fun(x),'k');
end
