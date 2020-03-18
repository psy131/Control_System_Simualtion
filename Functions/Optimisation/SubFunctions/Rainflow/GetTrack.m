function [track] = GetTrack(r)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    index = 0:pi/20:pi-0.001;
    
    xTot = [sin(index),-sin(index)];
    yTot = [cos(index),-cos(index)];
%     wayPointsStart = [(-28:4:-2)',zeros(7,1)];
    wayPointsRight = [r * xTot', (yTot' - 1) * -r];
%     wayPointsLeft = [r * xTot', (yTot' - 1) * r];
%     wayPointsEnd = [(0:4:30)',zeros(8,1)];

    
%     track = [wayPointsStart;wayPointsRight;wayPointsRight;wayPointsLeft;wayPointsLeft;wayPointsEnd];
    track = [wayPointsRight];

end