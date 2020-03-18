function [v31,Ln] = VelocityProfilOptimisation(bezierCurves,bezierLengths,mu_corn)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
totalLength = sum(bezierLengths);
tempLength = 0;
cappaCurve = [];
Ln = [];
deltaM = 0.1;
while(tempLength < totalLength)
    cappaCurve = [cappaCurve getKappa(tempLength,bezierCurves,bezierLengths)];
    Ln = [Ln tempLength];
    tempLength = tempLength + deltaM;
end
elements = length(cappaCurve);
shiftLength = floor(elements/2);
[v31] = calcSpeed(cappaCurve, 120/3.6, mu_corn);

    
end

function [v1] = calcSpeed(kappa, v_max, mu_corn)
%Constants
g = 9.81;
v1 = zeros(1,length(kappa));
    %% first speed calculation
    for i = 1:length(kappa)
        v1(i) = sqrt(mu_corn*g/abs(kappa(i)));
        if v1(i) > v_max
            v1(i) = v_max;
        end
    end

end