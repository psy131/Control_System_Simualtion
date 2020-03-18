function [LatAcc] = Cornering(Tracks,dist,egn17)
% LatAcc=zeros(numel(Tracks),1);
% LatStab=zeros(numel(Tracks),1);
Optimisation=1;
GetRmax=0;
SteerDisp=0;
Lateral=1;
mu_corn=1.1;
options = simset('SrcWorkspace','current');
egn17.z_0(1)=-10;
for i=5:5
    % Coefficients for Simulation
        BezierCurves=Tracks(:,:,:,i);
        BezierLength=getBezierLength(BezierCurves);

        [v31,Ln]=VelocityProfilOptimisation(BezierCurves,BezierLength,mu_corn);
    % Start Simulation
    try
        sim('vehicle_model',[],options)
    catch
    end
    % Process Logging
    a=simout_Optimisation.Lateral.a_C0.a_y.data==0;
    b=delsample(simout_Optimisation.Lateral.a_C0.a_y,'Index',1:sum(a));
    LatAcc(:,i)=mean(abs(b.data))*(dist(i,3)/(sum(dist(:,3))-max(dist(:,3))));
end
end

