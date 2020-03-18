function [AccelTime,BrakeTime] = Accel(egn17)
%ACCEL Summary of this function goes here
%   Detailed explanation goes here
Optimisation=1;
GetRmax=0;
SteerDisp=0;
Lateral=0;
mu_corn=1.1;
options = simset('SrcWorkspace','current');

    load('AccelWBraking');
    sim('vehicle_model',[],options)
    AccelTime=simout_z.x_C.time(numel(simout_z.x_C.data)-sum(simout_z.x_C.data>75))-2;
    BrakeTime=simtime-8;
%     BrakeDistance=75-simout_z.x_C.data(simout_z.dx_C_dt==0);
end

