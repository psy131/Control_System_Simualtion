function [v31,v4,Ln] = VelocityProfilJulian(bezierCurves,bezierLengths,vMax,myCorn,myAcc, myDec)
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
[v11,v21,v31] = calcSpeed(cappaCurve, deltaM,vMax,myCorn,myAcc, myDec,1,1);
[v12,v22,v32] = calcSpeed(circshift(cappaCurve,shiftLength), deltaM,vMax,myCorn,myAcc, myDec,1,1);
v1 = max(v11,circshift(v12,-shiftLength));
v2 = max(v21,circshift(v22,-shiftLength));
v3 = max(v31,circshift(v32,-shiftLength));

tempV31 = [v31 v31 v31];

%     figure(12)
%     plot(Ln,v1);
%     hold on
%     plot(Ln,v2);
%     plot(Ln,v3);
    
%     v4 = circshift(v3,-2 / deltaM);
%     v3 = [v3 v3 v3];
    for i = numel(v2)+1:2 * numel(v2)
        v4(i- numel(v2)) = min(v3(i-1/deltaM:i+3/deltaM));
        v31(i- numel(v2)) = min(tempV31(i-1/deltaM:i+3/deltaM));
    end

%     plot(Ln,v4);
%     legend('v1','v2','v3');
v4=0;
    
end

function [v1,v2,v3] = calcSpeed(kappa, deltaM, v_max, mu_corn, mu_acc, mu_dec,vStart,vEnd)
%Constants
g = 9.81;
m = 150;
m = 200;

W_r = g *m/2;
W_f = W_r;


v1 = zeros(1,length(kappa));
v2 = zeros(1,length(kappa));
v3 = zeros(1,length(kappa));
    %% first speed calculation
    for i = 1:length(kappa)
        v1(i) = sqrt(mu_corn*g/abs(kappa(i)));
        if v1(i) > v_max
            v1(i) = v_max;
        end
    end
    %% second speed calculation - forward integration
    for i = 1: 1: length(kappa)
        if i == 1
            %first point
            v2(i) = vStart;%0.1;
        else
            %max acceleration force
%             %F_x_acc = 1000; %N %constant force
              axMax = max(sqrt( (g/2)^2 - (v2(i-1)^2 * abs(kappa(i-1)) / (2 * mu_corn^2))^2) * mu_acc,0);
              
              massForce(i) = (g/2)^2;
              lateral(i) = (v2(i-1)^2 * abs(kappa(i-1)) / (2 * mu_corn^2))^2;
%             F_x_acc_f = sqrt((W_f*mu_acc)^2 - (W_f/g*v2(i-1)^2 * abs (kappa(i-1)))^2);
%             F_x_acc_r = sqrt((W_r*mu_acc)^2 - (W_r/g*v2(i-1)^2 * abs (kappa(i-1)))^2);

%             F_x_acc_f = sqrt((W_f*mu_acc)^2 - (W_f/g*v2(i-1)^2));
%             F_x_acc_r = sqrt((W_r*mu_acc)^2 - (W_r/g*v2(i-1)^2));
            
            F_x_acc_f = sqrt((W_f*mu_acc)^2 - (W_f/g*v2(i-1)^2));
            F_x_acc_r = sqrt((W_r*mu_acc)^2 - (W_r/g*v2(i-1)^2));
            F_x_acc = (F_x_acc_f+F_x_acc_r)/2;
            %F_x_acc = 4000;
            %other points
%             v2(i) = sqrt (real(v2(i-1)^2 + deltaM * 2 * F_x_acc / m));
            v2(i) = sqrt (real(v2(i-1)^2 + deltaM * 2 * axMax));
        end
        

        
        %take min value
        v2(i) = min([v1(i), v2(i)]);
    end
    
    
    %% third speed calculation - backward integration
    for i = length(kappa): -1: 1
        if i == length(kappa)
            %first point
            v3(i) = vEnd;%0.1;
        else
            %max deacceleration force
            axMax = max(sqrt( (g/2)^2 - (v2(i+1)^2 * abs(kappa(i+1)) / (2 * mu_corn^2))^2) * mu_dec,0);

            F_x_decc_f = sqrt((W_f*mu_dec)^2 - (W_f/g*v2(i+1))^2 * abs (kappa(i+1))^2);
            F_x_decc_r = sqrt((W_r*mu_dec)^2 - (W_r/g*v2(i+1))^2 * abs (kappa(i+1))^2);
            
%             F_x_decc_f = sqrt((W_f*mu_dec)^2 - (W_f/g*v2(i+1))^2);
%             F_x_decc_r = sqrt((W_r*mu_dec)^2 - (W_r/g*v2(i+1))^2);
            
            F_x_decc = (F_x_decc_f+F_x_decc_r)/2;
            %F_x_decc = 4000;
            %other points
%             v3(i) = sqrt(real(v3(i+1)^2 + deltaM * 2 * F_x_decc / m));
            v3(i) = sqrt (real(v3(i+1)^2 + deltaM * 2 * axMax));
        end
        %take min value
        v3(i) = min([v2(i), v3(i)]);
%         v3(i) = max([v3(i), 2]);
    end

    xPlot = [1:1:length(kappa)] * deltaM;

%             figure(12)
%             plot(xPlot,massForce);
%             hold on
%             plot(xPlot,lateral);
%         %     plot(xPlot,v3);
%             legend('mass','lateral');
%     
%     figure(11)
%     plot(xPlot,v1);
%     hold on
%     plot(xPlot,v2);
%     plot(xPlot,v3);
%     plot(xPlot,10 * (massForce > lateral));
%     legend('v1','v2','v3','accPos');

end


function [l] = calcLength(bezierCurves)

numberOfCurves = numel(bezierCurves(1,1,:));
    for j = 1:1:numberOfCurves
        fixPoints = bezierCurves(:,:,j);
        deltaT = 0.001;
        t = (0:deltaT:1);
        n = numel(fixPoints(:,1))-1; %degree is number of Points - 1

        p = fixPoints;


        c = zeros(numel(t),2);
        for i = 0:1:n
            binomial = nchoosek(n,i) * (1 - t).^(n-i) .* t.^i;
            c = c + binomial' * p(i+1,:);
        end
        l1 = zeros(length(c),1);
        for i = 1:length(c)-1
                    l1(i) = sqrt((c(i+1,1)-c(i,1))^2 + (c(i+1,2)-c(i,2))^2);
        end
        l(j) = sum(l1);
    end
end