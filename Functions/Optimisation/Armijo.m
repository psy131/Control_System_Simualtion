function [step] = Armijo(egn17,Tracks,dist,cost0,dpsi0,disturbance)
%% Armijo rule to determine the stepsize for the next optimisation-step
%  
fields=RemoveHPfromOptimisation('FDS',fieldnames(egn17.HPs));
fmin=-1.8;
alphal=(fmin-cost0)/(-sum(sum(dpsi0.*dpsi0)));
beta=0.9;
alpha=alphal*1/beta;
egn18=egn17;
if alpha > 0.02
    alpha=max(disturbance)/beta;
end
sigma=0.01;
costn=1000;
    while costn > cost0%+sigma*alpha*(-sum(sum(dpsi0.*dpsi0)))
        egn17=egn18;
        alpha=beta*alpha;
        for i = 1:numel(fields)
            for j = 1:3                   
                    egn17.HPs.(fields{i})(j)=egn17.HPs.(fields{i})(j)-(dpsi0(i,j)*alpha);
            end
        end
        [egn17,a,b]=Restrictions(egn17);
        egn17=MirrorHPs(egn17);
        try
            [LatAcc]=Cornering(Tracks,dist,egn17);
        catch
            LatAcc=0;
        end
    %   [AccelTime,BrakeTime]=Accel(egn17);
        costn=cost(LatAcc,0,0);
    end
step=alpha;
end

