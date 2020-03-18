function [lengh,ey,eYaw,kappa,previouseSpline] = doFrameConversion(pCar,yawCar,tol,bezierCurves,bezierLength,previouseSpline)
    epsilon = 0.000000000000001;
    pTarget = [pCar(1),pCar(2),yawCar];
    numberOfCurves = numel(bezierCurves(1,1,:));
    distCurve = 1000 * ones(numberOfCurves,1);
    tCurve = zeros(numberOfCurves,1);
%     for i = previouseSpline-2:1:previouseSpline+2
    for i = 0:1:numberOfCurves
        curve = bezierCurves(:,:,mod(i-1,numberOfCurves)+1);
        %plotBezierCurves(curve, i -1);
        [tCurve(mod(i-1,numberOfCurves)+1),distCurve(mod(i-1,numberOfCurves)+1)] = findClosestPoint(curve,tol,pTarget(1:2));
    end
    [~,closedCurve] = min(distCurve);
    previouseSpline = closedCurve;
    lengh = 0;
    step = 0.001;
    for i = 1:1:closedCurve - 1
        lengh = lengh + bezierLength(i);
    end
    lengh = lengh + calcLengthOfSegment(bezierCurves(:,:,closedCurve),step,tCurve(closedCurve));

    ey = distCurve(closedCurve);

    [kappa,dir] = calcKappaTangent(bezierCurves(:,:,closedCurve),tCurve(closedCurve));
    normalVec = [-dir(2),dir(1)];
    closestPoint = pointInCurve(bezierCurves(:,:,closedCurve),tCurve(closedCurve));
    if (norm(pTarget(1:2) - closestPoint)) < norm(pTarget(1:2) - closestPoint - epsilon * normalVec)
       ey = -ey; 
    end
    
    eYaw = pTarget(3) - atan2(dir(2),dir(1));
    while eYaw > pi
        eYaw = eYaw - 2 * pi;
    end
    while eYaw < -pi
        eYaw = eYaw + 2 * pi;
    end
%     eYaw = -eYaw;
    %% Calculate Kappa for next curves
    
    initDist = lengh;
    actDist = 0;
    i = closedCurve;

%     tstart = tCurve(closedCurve);
%     index = 1;
%     if distIteration < 10
%         distIteration = 10;
%     end
%     while actDist < distIteration
%         kappaS(index) = calcKappaTangent(bezierCurves(:,:,1 + mod(i - 1,numberOfCurves)),tstart);
%         distCov(index) = lengthTillCurve + calcLengthOfSegment(bezierCurves(:,:,1 + mod(i - 1,numberOfCurves)),step,tstart);
%         tstart = tstart + 0.0002 * index;
%         actDist = distCov(index) - initDist;
%         if tstart > 1
%             lengthTillCurve = lengthTillCurve + calcLengthOfSegment(bezierCurves(:,:,1 + mod(i - 1,numberOfCurves)),step,1);
%             tstart = tstart - 1;
%             i = i+1;
%         end
%         index = index + 1;
%     end
%     
%     distCov = distCov - distCov(1);
%     
% %     figure(1)
% %     hold on
% %     plot(distCov,kappaS);
%     kappaPol = polyfit(distCov,kappaS,5);
%     kappaSapprox = polyval(kappaPol,distCov);
%     plot(distCov,kappaSapprox)
end

%% DONT CHANGE ANYTHING DOWN HERE, JUST CHANGE THE FIRST PART IF NECCESARY


function [t,dist] = findClosestPoint(curve,tol,refPoint)
    t = 0.5;
    initPoint = pointInCurve(curve,t);
    dist = norm(initPoint - refPoint);
    h = 0.25;
    while h > tol
         tR = t + h;
         pR = pointInCurve(curve,tR);
         distR = norm(pR - refPoint);
         tL = t - h; 
         pL = pointInCurve(curve,tL);
         distL = norm(pL - refPoint);
         if distR < dist
             dist = distR;
             t = tR;
         elseif distL < dist
             dist = distL;
             t = tL;
         end
         h = h/2;
    end
end

function point = pointInCurve(curve,t)
    VecT = [1,t,t^2,t^3];
    Mat = [ 1  0  0  0;...
           -3  3  0  0;...
            3 -6  3  0;...
           -1  3 -3  1];
    point = VecT * Mat * curve;
end


function l = calcLengthOfSegment(curve,step,t)
%     subsec = 0:step:t;
%     pointsFirstDev = 3 * [curve(2,:) - curve(1,:); curve(3,:) - curve(2,:);curve(4,:) - curve(3,:)];
%     matT = ones(numel(subsec),4);
%     matT(:,2) = subsec';
%     matT(:,3) = subsec'.^2;
%     matT(:,4) = subsec'.^3;
%     convMat = [ 1  0  0  0;...
%                -3  3  0  0;...
%                 3 -6  3  0;...
%                -1  3 -3  1];
%     point = matT * convMat * curve;
%     l = 0;
%     for i = 1:numel(subsec)-1
%        l = l + norm(point(i,:) - point(i+1,:));
%     end
    
    subsec = 0:step:t;
    pointsFirstDev = 3 * [curve(2,:) - curve(1,:); curve(3,:) - curve(2,:);curve(4,:) - curve(3,:)];
    matT = ones(numel(subsec),3);
    matT(:,2) = subsec';
    matT(:,3) = subsec'.^2;
    convMat = [ 1  0  0;...
               -2  2  0;...
                1 -2  1];
    point = matT * convMat * pointsFirstDev;
    l = sum(sqrt(point(:,1).^2 + point(:,2).^2)) * step;
    
    %this function needs to be done in a more beautiful way.
end

function [kappa,dir] = calcKappaTangent(curve,t)
    if t == 0
        t = 0.0001;
    end
    if t == 1
        t = 0.9999;
    end
    pointsFirstDev = 3 * [curve(2,:) - curve(1,:); curve(3,:) - curve(2,:);curve(4,:) - curve(3,:)];
    matT = [1,t,t^2];
    convMat = [ 1  0  0;...
               -2  2  0;...
                1 -2  1];
    dev1 = matT * convMat * pointsFirstDev;
   
    pointsSecondDev = 2 * [pointsFirstDev(2,:) - pointsFirstDev(1,:); pointsFirstDev(3,:) - pointsFirstDev(2,:)];
    matT = [1,t];
    convMat = [ 1  0;...
                -1  1];
    dev2 = matT * convMat * pointsSecondDev;
    
    kappa = (dev1(1).*dev2(2) - dev1(2).*dev2(1)) ./ (dev1(1).^2 + dev1(2).^2).^(3/2);
    dir = dev1/norm(dev1);    
end