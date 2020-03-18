function [Bezier] = CalcBezier(points)
    numberOfCurves = numel(points(:,1));
    [AeqXY,BeqXY] = calcAB(numberOfCurves,points);
    result = (AeqXY^-1) * BeqXY;
        x = [result(1:numberOfCurves * 3,:);result(1,:)];   
    Bezier = zeros(4,2,numberOfCurves);
    for i = 1:numberOfCurves
        Bezier(:,:,i) = x((1 + (i-1) * 3):(4 + (i-1) * 3),:);
    end
end

