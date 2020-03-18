function [] = Plots(simout_S,simout_z,simtime,track)
r_C_0=zeros(3,length(simout_z.x_C.data));
for i=1:length(simout_z.x_C.data)
r_C_0(:,i)=[simout_z.x_C.data(i);simout_z.y_C.data(i);simout_z.z_C.data(i)] + simout_S.S_Chassis.S_0_C.data(:,:,i)*[1.53/2;0;0];
end
time=linspace(0,simtime,length(simout_z.x_C.data));
%% Plot trajectory
% figure(1)
openfig(track);
hold on
plot(r_C_0(1,:),r_C_0(2,:));
% plotBezierCurves(bezierCurves,'r');
hold off
%% Plot Chassis
% Plot x,y,z,alpha,beta,gamma in multiple windows along time
% figure(2,'Name','All coordinates above time');
figure(2)
subplot(2,3,1)
plot(time,r_C_0(1,:))
title('x-Values');

subplot(2,3,2)
plot(time,r_C_0(2,:))
title('y-Values');

subplot(2,3,3)
plot(time,r_C_0(3,:))
title('z-Values')

subplot(2,3,4)
plot(simout_z.alpha_C*180/pi)
title('Roll-angle');

subplot(2,3,5)
plot(simout_z.beta_C*180/pi)
title('Pitch-angle');

subplot(2,3,6)
plot(simout_z.gamma_C*180/pi)
title('Yaw-angle');


end

