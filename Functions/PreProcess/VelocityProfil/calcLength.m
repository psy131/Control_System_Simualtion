function [l] = calcLength(bezierCurves)

numberOfCurves = numel(bezierCurves(1,1,:));
    for j = 1:1:numberOfCurves
        fixPoints = bezierCurves(:,:,j);
        deltaT = 0.001;
        t = (0:deltaT:1);
        n = numel(fixPoints(:,1))-1; %degree is number of Points - 1

        p = fixPoints;


        c = zeros(numel(t),2);
        for i = 0:1:n
            binomial = nchoosek(n,i) * (1 - t).^(n-i) .* t.^i;
            c = c + binomial' * p(i+1,:);
        end
        l1 = zeros(length(c),1);
        for i = 1:length(c)-1
                    l1(i) = sqrt((c(i+1,1)-c(i,1))^2 + (c(i+1,2)-c(i,2))^2);
        end
        l(j) = sum(l1);
    end
end