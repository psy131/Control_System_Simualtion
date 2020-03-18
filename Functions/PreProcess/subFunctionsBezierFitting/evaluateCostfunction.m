function [result,cost] = evaluateCostfunction(points,Aeq,weights)
    numberOfCurves = numel(Aeq(1,:)) / 6;
    BeqFull = zeros(numberOfCurves * 6,1);
    for i = 0:numberOfCurves - 1        
        n = i * 3 + 1;
        BeqFull(n) = points(i+1,1);
        BeqFull(numberOfCurves * 3 + n) = points(i+1,2);        
    end 
    result = mldivide(Aeq,BeqFull);
    cost = PSObezier(result,weights);
end