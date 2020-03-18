function [BezierCurves,BezierLength,kappa,v31,v4,Ln] = PreProcess(Track)

vMax=120/3.6;
myCorn=1.5;
myAcc=1.2;
myDec=1.2;
[BezierCurves,kappa] = calcBezierOnlyCenterline(Track,1);
BezierLength = getBezierLength(BezierCurves);
[v31,v4,Ln]=VelocityProfilJulian(BezierCurves,BezierLength,vMax,myCorn,myAcc,myDec);
end

