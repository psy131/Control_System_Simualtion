function [curv,c,xDotDot,yDotDot] = calcCurvature(points)
    fixPoints = points;
    deltaT = 0.01;
    t = (0:deltaT:1);
    n = numel(fixPoints(:,1))-1; %degree is number of Points - 1

    p = fixPoints;
    c = zeros(numel(t),2);
    for i = 0:1:n
        binomial = nchoosek(n,i) * (1 - t).^(n-i) .* t.^i;
        c = c + binomial' * p(i+1,:);
    end
    
    pDot = zeros(n,2);
    for i = 0:1:n-1
        pDot(i+1,:) = n * (fixPoints(i+2,:) - fixPoints(i+1,:));
    end
    cDot = zeros(numel(t),2);
    for i = 0:1:n-1
        binomial = nchoosek(n-1,i) * (1 - t).^(n-1-i) .* t.^i;
        cDot = cDot + binomial' * pDot(i+1,:);
    end

    pDotDot = zeros(n-1,2);
    for i = 0:1:n-2
        pDotDot(i+1,:) = (n-1) * (pDot(i+2,:) - pDot(i+1,:));
    end
    cDotDot = zeros(numel(t),2);
    for i = 0:1:n-2
        binomial = nchoosek(n-2,i) * (1 - t).^(n-2-i) .* t.^i;
        cDotDot = cDotDot + binomial' * pDotDot(i+1,:);
    end
    xDotDot = cDotDot(:,1);
    yDotDot = cDotDot(:,2);
    curv = (cDot(:,1).*cDotDot(:,2) - cDot(:,2).*cDotDot(:,1)) ./ (cDot(:,1).^2 + cDot(:,2).^2).^(3/2);
end