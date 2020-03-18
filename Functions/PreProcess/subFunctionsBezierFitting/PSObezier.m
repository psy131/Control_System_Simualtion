%PSO Partical Swarm Optimiziation

function J = PSObezier(particle,weights)

    a = weights(1);
    b = weights(2);
    c = weights(3);
    
    numberOfCurves = numel(particle) / 6;
    
    x = [particle(1:numberOfCurves * 3),particle(numberOfCurves * 3 + 1:numberOfCurves * 6);particle(1),particle(numberOfCurves * 3 + 1)];

    %% Get Params in function form    

    J = 0;
    for i = 1:1:numberOfCurves
       curSec = x(1 + (i-1) * 3:4 + (i-1) * 3,:);
       [curv,track] = calcCurvature(curSec);    
       curvDot = zeros(numel(curv),1);
       dist = zeros(numel(curv),1);
       for j = 1:1:numel(curv)-1
           curvDot(j) = curv(j+1) - curv(j);
           dist(j) = norm(track(j+1,:) - track(j,:));
       end
       curvDot(i+1) = curvDot(i);
       dist(i+1) = dist(i);

       J = J + sum(a * curv.^2 + b * curvDot.^2 + c * dist.^2);
    end
end