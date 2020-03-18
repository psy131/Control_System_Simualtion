function [v1,v2,v3,Ln] = VelocityProfil(bezierCurves,kappa)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[v1,v2,v3] = calcSpeed(kappa);
l = calcLength(bezierCurves);
L = zeros(length(l),1);
L(1) = l(1);
for i = 2:length(l)
    L(i,1) = l(i)+ L(i-1);
end
Ln = linspace(0,max(L),length(v3));
end
