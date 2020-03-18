function bezierLength = getBezierLength(bezierCurves)
    numberOfCurves = numel(bezierCurves(1,1,:));
    bezierLength = zeros(numberOfCurves,1);
    for i = 1:numberOfCurves
        bezierLength(i) = calcLengthOfSegment(bezierCurves(:,:,i),0.001,1);
    end
end

function l = calcLengthOfSegment(curve,step,t)
    subsec = 0:step:t;
    matT = ones(numel(subsec),4);
    matT(:,2) = subsec';
    matT(:,3) = subsec'.^2;
    matT(:,4) = subsec'.^3;
    convMat = [ 1  0  0  0;...
               -3  3  0  0;...
                3 -6  3  0;...
               -1  3 -3  1];
    point = matT * convMat * curve;
    l = 0;
    for i = 1:numel(subsec)-1
       l = l + norm(point(i,:) - point(i+1,:));
    end
    
%     subsec = 0:step:t;
%     pointsFirstDev = 3 * [curve(2,:) - curve(1,:); curve(3,:) - curve(2,:);curve(4,:) - curve(3,:)];
%     matT = ones(numel(subsec),3);
%     matT(:,2) = subsec';
%     matT(:,3) = subsec'.^2;
%     convMat = [ 1  0  0;...
%                -2  2  0;...
%                 1 -2  1];
%     point = matT * convMat * pointsFirstDev;
%     l = sum(sqrt(point(:,1).^2 + point(:,2).^2)) * step;
    
    %this function needs to be done in a more beautiful way.
end