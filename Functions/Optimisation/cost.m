function [psi] = cost(LatAcc,AccelTime,BrakeTime)
a=-1;
b=1;
c=1;
d=1;
e=1;

    Lateral=a*sum(LatAcc);%+b*sum((Lateral_Balance-0.5).^2)
    Longitudinal=c*AccelTime+d*BrakeTime;%+e*BrakeDistance;

    psi=Lateral+Longitudinal;
end

