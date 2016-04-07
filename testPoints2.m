function pointClass = testPoints2(x,y)
    lineFunction = fitLine(x,y);
    parabolaFunction = fitParabola(x,y);
    
    pIsAboveLine = y > lineFunction(x);
    pIsAboveParabola = y < parabolaFunction(x);
    
    aboveBoth = pIsAboveLine & pIsAboveParabola;
    onlyAboveLine = pIsAboveLine & ~pIsAboveParabola;
    onlyAboveParabola = ~pIsAboveLine & pIsAboveParabola;
    belowBoth = ~pIsAboveLine & ~pIsAboveParabola;
    
    pointClass(aboveBoth) = 1;
    pointClass(onlyAboveLine) = 2;
    pointClass(onlyAboveParabola) = 3;
    pointClass(belowBoth) = 4;
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
