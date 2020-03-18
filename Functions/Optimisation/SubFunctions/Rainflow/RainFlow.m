function [RadiLength] = RainFlow(radmax,Ln,BezierCurves,BezierLength)
%% Rainflow analysis to divide the track into curvature-distances
%     load('FSG.mat');
    L_AX=max(Ln);
    radmin=4;
    deltaM=0.1;
    step=2;
    RadiLength=zeros(round((radmax-radmin)/step),3);
    j=radmin;
    for i=radmin:step:(radmax-step)
        up=i+step;
        RadiLength(j-radmin+1,1)=i;
        RadiLength(j-radmin+1,2)=up;
        RadiLength(j-radmin+1,3)=RadiDist(BezierCurves,BezierLength,i,i+step,L_AX,deltaM);
        j=j+1;
    end
end

