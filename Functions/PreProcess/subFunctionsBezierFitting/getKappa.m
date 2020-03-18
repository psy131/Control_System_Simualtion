function [kappa,sMeas] = getKappa(s, bezierCurves, bezierLength)
%#codegen
    temp = s;
    distCurves = 0;
    index = 0;
    totalLengh = sum(bezierLength);
%     if (s > totalLengh)
        s = mod(s,totalLengh);
%     end


    while distCurves <= s
        index = index + 1;
        distCurves = distCurves + bezierLength(index);
    end
    distCurves = distCurves - bezierLength(index);
    
    
    
    curve = bezierCurves(:,:,index);
    
    deltaT = 0.001;
    tCurve = (0:deltaT:1);
    n = numel(curve(:,1))-1; %degree is number of Points - 1

    curve = bezierCurves(:,:,index);
    c = zeros(numel(tCurve),2);
    for i = 0:1:n
        binomial = nchoosek(n,i) * (1 - tCurve).^(n-i) .* tCurve.^i;
        c = c + binomial' * curve(i+1,:);
    end
       
    t = 0;
    step = 0.001;
    index = 1;
    while distCurves < s
        point1 = c(index,:);
        point2 = c(index+1,:);
        index = index + 1;
        distCurves = distCurves + sqrt(sum((point1-point2).^2));
        t = t+step;
        if t > 0.99
           dip = 0; 
        end
    end
    
    sMeas = distCurves;
    
    convMat = [ 1  0  0;...
           -2  2  0;...
            1 -2  1];
    pointsFirstDev = 3 * [curve(2,:) - curve(1,:); curve(3,:) - curve(2,:);curve(4,:) - curve(3,:)];
    matTdev1 = [1,t,t^2];
    dev1 = matTdev1 * convMat * pointsFirstDev;

    pointsSecondDev = 2 * [pointsFirstDev(2,:) - pointsFirstDev(1,:); pointsFirstDev(3,:) - pointsFirstDev(2,:)];
    matTdev2 = [1,t];
    convMat = [ 1  0;...
                -1  1];
    dev2 = matTdev2 * convMat * pointsSecondDev;
    
    kappa = (dev1(1).*dev2(2) - dev1(2).*dev2(1)) ./ (dev1(1).^2 + dev1(2).^2).^(3/2);

end