
function [Bezier,cost,numBi] = psoinit(points,trackWidth,prescision,weights)
    %% Problem Definition
    numberOfCurves = numel(points(:,1));
    
    dir = zeros(numberOfCurves,2);
    P1 = points(numberOfCurves,:);
    P2 = points(1,:);
    for i = 1:numberOfCurves
       P3 = points(mod(i,numberOfCurves) + 1,:);
       dir(i,:) =  getNormalVectorInCorner(P1,P2,P3);
       P1 = P2;
       P2 = P3;
    end
%     setGlobalPoints(points);
    setGlobalDir(dir);

    
    %% Define equality constraint for all Bezier Curves
    %x and y variables are seperated into two groups
    % each span from 1 to numberOfCurves * 3 + 1 (each curve has a unique
    % Waypoint and at the end there is an aditional Waypoint
    % Matrix for X and Y are identical
    AeqXY = calcAeqBeq(numberOfCurves);
    
    
    AeqFull = [AeqXY,zeros(numberOfCurves * 3);
               zeros(numberOfCurves * 3),AeqXY];
    for i = 0:numberOfCurves - 1       
        n = i * 3 + 1;
        AeqFull(n,n) = 1;        
        AeqFull(numberOfCurves * 3 + n, numberOfCurves * 3 + n) = 1;           
    end
    
    [~,minCost] = evaluateCostfunction(points,AeqFull,weights);
    
    stepSize = trackWidth / 4;
    numBi = 0;
    while( stepSize > prescision)
        numBi = numBi + 1;
        grad = zeros(numberOfCurves,1);
        for j = 1:numberOfCurves
            pointGrad = points;
            pointGrad(j,:) = points(j,:) + dir(j,:) * stepSize;
            [~,posCost] = evaluateCostfunction(pointGrad,AeqFull,weights);
            
            pointGrad = points;
            pointGrad(j,:) = points(j,:) - dir(j,:) * stepSize;
            [~,negCost] = evaluateCostfunction(pointGrad,AeqFull,weights);
            if negCost < posCost && negCost < minCost
            %if negCost < minCost
                grad(j) = -1;
            elseif negCost > posCost && posCost < minCost
                grad(j) = 1; 
            end
        end
        points = points + [dir(:,1) .* grad * stepSize, dir(:,2) .* grad * stepSize];
        [~,minCost] = evaluateCostfunction(points,AeqFull,weights); 
        %costBi(numBi) = minCost;
        stepSize = stepSize / 4;
    end
    [bestResult,minCost] = evaluateCostfunction(points,AeqFull,weights); 
    %[result,fval] = patternsearch(@PSObezier,init,[],[],AeqFull,BeqFull,lBound,uBound,[]);
    %result = ga(@PSObezier,numel(init),[],[],AeqFull,BeqFull,lBound,uBound,[]);
    Bezier = convertToBezier(bestResult);
    cost = minCost;

end