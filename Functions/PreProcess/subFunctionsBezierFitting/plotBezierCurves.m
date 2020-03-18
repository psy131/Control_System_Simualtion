function [kappa] = plotBezierCurves(bezierCurves,color)
    deltaT = 0.01;
    numberOfCurves = numel(bezierCurves(1,1,:));
    kappa = zeros(numberOfCurves * 1/deltaT,1,1);
    for j = 1:1:numberOfCurves
        fixPoints = bezierCurves(:,:,j);

        t = (0:deltaT:1);
        n = numel(fixPoints(:,1))-1; %degree is number of Points - 1

        p = fixPoints;


        c = zeros(numel(t),2);
        for i = 0:1:n
            binomial = nchoosek(n,i) * (1 - t).^(n-i) .* t.^i;
            c = c + binomial' * p(i+1,:);
        end
        figure(5)
        hold on
        plot(c(:,1),c(:,2),color);


        plot(fixPoints(1,1),fixPoints(1,2),'r*'); 
        %plot(fixPoints(2:3,1),fixPoints(2:3,2),'*'); 
        plot(fixPoints(4,1),fixPoints(4,2),'r*'); 


        %pDotBegin = n * (fixPoints(2,:) - fixPoints(1,:));
        %pDodEnd = n * (fixPoints(4,:) - fixPoints(3,:));   

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


        curv = (cDot(:,1).*cDotDot(:,2) - cDot(:,2).*cDotDot(:,1)) ./ (cDot(:,1).^2 + cDot(:,2).^2).^(3/2);
        fig = figure(6);
        fig.Position = [1346,30,560,400];
        subplot(5,1,1)
        hold on
        plot((j-1) + t,cDot(:,1),color);

        subplot(4,1,2)
        hold on
        plot((j-1) + t,cDot(:,2),color);

        subplot(4,1,3)
        hold on
        plot((j-1) + t,cDotDot(:,1),color);

        subplot(4,1,4)
        hold on
        plot((j-1) + t,cDotDot(:,2),color);

        
        figure(7)
        hold on
        plot((j-1) + t,curv,color);
        for i = 1:length(curv)
        kappa(i+(j-1)*length(curv)) = curv(i);
        end
    end
end