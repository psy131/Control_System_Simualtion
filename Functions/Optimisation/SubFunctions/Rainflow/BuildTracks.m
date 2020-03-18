function [Tracks,RadLength] = BuildTracks(BezierCurves,BezierLength,Ln,radmax)
%CHECKSTREIGHT Summary of this function goes here
%   Detailed explanation goes here
    RadLength=RainFlow(radmax,Ln,BezierCurves,BezierLength);
%     Tracks=zeros(10,2,40,numel(RadLength(:,3))-1);
    dist=zeros(numel(RadLength(:,3))-1,1);
    for i=1:numel(RadLength(:,3))-1 
        Tracks(:,:,:,i)=CalcBezier(GetTrack(mean(RadLength(i,1:2))));
        dist(i)=RadLength(i,3);
    end
end