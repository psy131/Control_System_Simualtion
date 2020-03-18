function [v1,v2,v3] = calcSpeed(kappa)
%Constants
g = 9.81;
m = 150;
m = 200+75;
mu_corn = 0.6;
mu_acc = 1.1;
mu_dec = 1.1;
W_r = g *m/2;
W_f = W_r;
v_max = 120/3.6;

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
            v2(i) = 0.1;
        else
            %max acceleration force
            %F_x_acc = 1000; %N %constant force
            F_x_acc = sqrt((W_r*mu_acc)^2 - (W_r/g*v2(i-1)^2 * abs (kappa(i-1)))^2);
            %F_x_acc = 4000;
            %other points
            v2(i) = sqrt (real(v2(i-1)^2 + 2 * F_x_acc / m));
        end
        
        %take min value
        v2(i) = min([v1(i), v2(i)]);
    end
    
    %% third speed calculation - backward integration
    for i = length(kappa): -1: 1
        if i == length(kappa)
            %first point
            v3(i) = 0.1;
        else
            %max deacceleration force
            F_x_decc_f = sqrt((W_f*mu_dec)^2 - (W_f/g*v2(i+1))^2 * abs (kappa(i+1))^2);
            F_x_decc_r = sqrt((W_r*mu_dec)^2 - (W_r/g*v2(i+1))^2 * abs (kappa(i+1))^2);
            F_x_decc = (F_x_decc_f+F_x_decc_r)/2;
            %F_x_decc = 4000;
            %other points
            v3(i) = sqrt(real(v3(i+1)^2 + 2 * F_x_decc / m));
        end
        %take min value
        v3(i) = min([v2(i), v3(i)]);
    end






end

