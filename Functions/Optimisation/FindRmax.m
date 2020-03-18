function [rmax] = FindRmax(egn17,BezierCurves,BezierLength,Ln,v31)
% Simulation-Constants
GetRmax=1;
Optimisation=1;
Lateral=1;
Distance=5000;
rmax=zeros(4,1);
set_param('vehicle_model','StopTime','50');
options = simset('SrcWorkspace','current');
j=1;
m=1;
% Vehicle-Constants
for n=0.001:0.001:0.005
for i=0.01:n:0.04
    SteerDisp=i;
    sim('vehicle_model',[],options)
    rmax(j,1)=simout_Optimisation.Lateral.v_C0.dx_dt.data(simout_Optimisation.Lateral.v_C0.dx_dt.time==simout_z.dgamma_C_dt.time(simout_z.dgamma_C_dt.data==max(simout_z.dgamma_C_dt.data)))^2/...
        simout_Optimisation.Lateral.a_C0.a_y.data(simout_Optimisation.Lateral.a_C0.a_y.time==simout_z.dgamma_C_dt.time(simout_z.dgamma_C_dt.data==max(simout_z.dgamma_C_dt.data)));
    j=j+1;
end

    r(m)=mean(rmax);
    m=m+1;
end

% TIME=simout_z.dgamma_C_dt.time(simout_z.dgamma_C_dt.data==max(simout_z.dgamma_C_dt.data))