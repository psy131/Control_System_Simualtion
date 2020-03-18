function [RadiLength] = RadiDist(BezierCurves,BezierLength,LowBound,UpBound,L_AX,deltaM)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
for i=0:round(L_AX)/deltaM
    [kappa,sMeas]=getKappa(i/deltaM,BezierCurves,BezierLength);
    s(i+1)=sMeas;
    if abs(kappa) > 1/LowBound
        s(i+1)=0;
    end
    if abs(kappa) < 1/UpBound
        s(i+1)=0;
    end
end
RadiLength=sum(s>0) * deltaM;
end

