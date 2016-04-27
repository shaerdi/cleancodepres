function pointClass = testPoints2(xCoords,yCoords)
    lineFunction = fitLine(xCoords,yCoords);
    parabolaFunction = fitParabola(xCoords,yCoords);
    
    pIsAboveLine = yCoords > lineFunction(xCoords);
    pIsAboveParabola = yCoords < parabolaFunction(xCoords);
    
    aboveBoth = pIsAboveLine & pIsAboveParabola;
    onlyAboveLine = pIsAboveLine & ~pIsAboveParabola;
    onlyAboveParabola = ~pIsAboveLine & pIsAboveParabola;
    belowBoth = ~pIsAboveLine & ~pIsAboveParabola;
    
    pointClass(aboveBoth) = 1;
    pointClass(onlyAboveLine) = 2;
    pointClass(onlyAboveParabola) = 3;
    pointClass(belowBoth) = 4;
end

function lineFunction = fitLine(xCoords,yCoords)
    leastSquaresMatrix = [xCoords, ones(size(xCoords))];
    leastSquaresRHS = yCoords;
    lineParam = leastSquaresMatrix \ leastSquaresRHS;
    lineFunction = @(x) lineParam(1) * x + lineParam(2);
end

function parabolaFunction = fitParabola(xCoords,yCoords)
    leastSquaresMatrix = [xCoords.^2,xCoords,ones(size(xCoords))];
    leastSquaresRHS = yCoords;
    parabolaParam = leastSquaresMatrix \ leastSquaresRHS;
    parabolaFunction =  ...
        @(x) parabolaParam(1)*x.^2 + parabolaParam(2)*x + parabolaParam(3);
end
