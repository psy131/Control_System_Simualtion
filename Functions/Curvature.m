clearvars -except BC_CarPosition__BC_CarPositionX BC_CarPosition__BC_CarPositionY BC_XSensAcceleration__BC_XSensAccY

if numel(BC_XSensAcceleration__BC_XSensAccY) > 3000
    BC_XSensAcceleration__BC_XSensAccY(1:8827,:) = [];
    BC_XSensAcceleration__BC_XSensAccY(900:end,:) = [];
    BC_CarPosition__BC_CarPositionX(1:8827,:) = [];
    BC_CarPosition__BC_CarPositionX(900:end,:) = [];
    BC_CarPosition__BC_CarPositionY(1:8827,:) = [];
    BC_CarPosition__BC_CarPositionY(900:end,:) = [];
end

ay = BC_XSensAcceleration__BC_XSensAccY(abs(BC_XSensAcceleration__BC_XSensAccY(:,2)) > 1*9.81,2);
xPos = BC_CarPosition__BC_CarPositionX(abs(BC_XSensAcceleration__BC_XSensAccY(:,2)) > 1*9.81,2);
yPos = BC_CarPosition__BC_CarPositionY(abs(BC_XSensAcceleration__BC_XSensAccY(:,2)) > 1*9.81,2);

for i = 1:900
%    if abs(BC_XSensAcceleration__BC_XSensAccY(i,2)) < 1*9.81 
%        BC_XSensAcceleration__BC_XSensAccY(i,:) = ;
%        BC_CarPosition__BC_CarPositionX(i,:) = [];
%        BC_CarPosition__BC_CarPositionY(i,:) = [];
%    end
end
plot(BC_XSensAcceleration__BC_XSensAccY(:,1),BC_XSensAcceleration__BC_XSensAccY(:,2))

[BezierCurves,kappa] = calcBezierOnlyCenterline('FSG');
bezierLength = getBezierLength(BezierCurves);
for i = 1:numel(xPos)
    
    
    
    
    
    s(i) = doFrameConversion([xPos(i) yPos(i)],0,0.00001,BezierCurves,bezierLength,0.01);
    kappaS(i) = getKappa(s(i) ,  BezierCurves,bezierLength);
end

kappaX = min(s):0.1:max(s);
for i = 1:numel(kappaX)
   kappaPlot(i) = getKappa(kappaX(i),  BezierCurves,bezierLength);
end

figure(98)
plot(s,kappaS,'*')
hold on
plot(kappaX,kappaPlot,'r')

kappaK = kappaPlot






















%%
for i = 1:numel(x)
    for j = 1:numel(x)
        if i == j
          z(i,j) = BC_XSensAcceleration__BC_XSensAccY(i,2);
        else 
            z(i,j) = NaN;
        end
    end    
end



