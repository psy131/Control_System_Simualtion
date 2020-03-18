function [Bezier,kappa] = calcBezierOnlyCenterline(trackName, openLoop)

    if nargin == 2   % if the number of inputs equals 2
        openLoop = true;

    end
    if nargin == 1
        openLoop = false;
    end
    currentPath = pwd;
%     cd('..\Functions\TrackDataBezierFitting')
    points = eval(trackName);
%     cd('..\subFunctionsBezierFitting');
    
    if openLoop
        startstartRef = points(1,:) - (points(2,:) - points(1,:)) * 2;
        startRef = points(1,:) - (points(2,:) - points(1,:));
        endRef = points(end,:) + (points(end,:) - points(end-1,:));
        endEndRef = points(end,:) + (points(end,:) - points(end-1,:)) * 2;
        points = [startstartRef;startRef;points;endRef;endEndRef];
    end
    numberOfCurves = numel(points(:,1));
    
    [AeqXY,BeqXY] = calcAB(numberOfCurves,points);
    cd(currentPath);
    result = (AeqXY^-1) * BeqXY;
    if openLoop
        x = result(7:numberOfCurves * 3 - 8,:);
        numberOfCurves = numberOfCurves - 5;
    else
        x = [result(1:numberOfCurves * 3,:);result(1,:)];
    end
    
    Bezier = zeros(4,2,numberOfCurves);
    for i = 1:numberOfCurves
        Bezier(:,:,i) = x((1 + (i-1) * 3):(4 + (i-1) * 3),:);
    end
%     cd('..\Functions\subFunctionsBezierFitting')
    kappa = plotBezierCurves(Bezier,'k');
    cd(currentPath);
end