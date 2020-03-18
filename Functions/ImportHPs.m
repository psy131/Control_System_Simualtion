clear all;
close all;
clc;
%% Dateipfade
addpath(genpath('../ImportFiles'));
%%
load('vehicle_data_egn18(combined)')
Table = 'Porsche-Feedback';
%Front Suspension from OptimumKinematics
%Left side
egn17.HPs.a_fl = (xlsread(Table,'Front Suspension','K15:M15'))';
egn17.HPs.b_fl = (xlsread(Table,'Front Suspension','K14:M14'))';
egn17.HPs.c_fl = (xlsread(Table,'Front Suspension','K18:M18'))';
egn17.HPs.d_fl = (xlsread(Table,'Front Suspension','K17:M17'))';
egn17.HPs.e_fl = (xlsread(Table,'Front Suspension','K16:M16'))';
egn17.HPs.f_fl = (xlsread(Table,'Front Suspension','K19:M19'))';
egn17.HPs.g_fl = (xlsread(Table,'Front Suspension','K25:M25'))';
% egn17.HPs.h_fl = (xlsread(Table,'Front Suspension','K27:M27'))';
egn17.HPs.i_fl = (xlsread(Table,'Front Suspension','K28:M28'))';
% egn17.HPs.j_fl = (xlsread(Table,'Front Suspension','K29:M29'))';
% egn17.HPs.k_fl = (xlsread(Table,'Front Suspension','K30:M30'))';
% egn17.HPs.t_fl = (xlsread(Table,'Front Suspension','K26:M26'))';

%%
%Right side
for i = 1:3
egn17.HPs.a_fr(i) = (-1)^(i+1) * egn17.HPs.a_fl(i);
end
for i = 1:3
egn17.HPs.b_fr(i) = (-1)^(i+1) * egn17.HPs.b_fl(i);
end
for i = 1:3
egn17.HPs.c_fr(i) = (-1)^(i+1) * egn17.HPs.c_fl(i);
end
for i = 1:3
egn17.HPs.d_fr(i) = (-1)^(i+1) * egn17.HPs.d_fl(i);
end
for i = 1:3
egn17.HPs.e_fr(i) = (-1)^(i+1) * egn17.HPs.e_fl(i);
end
for i = 1:3
egn17.HPs.f_fr(i) = (-1)^(i+1) * egn17.HPs.f_fl(i);
end
for i = 1:3
egn17.HPs.g_fr(i) = (-1)^(i+1) * egn17.HPs.g_fl(i);
end
% for i = 1:3
% egn17.HPs.h_fr(i) = (-1)^(i+1) * egn17.HPs.h_fl(i);
% end
for i = 1:3
egn17.HPs.i_fr(i) = (-1)^(i+1) * egn17.HPs.i_fl(i);
end
% for i = 1:3
% egn17.HPs.j_fr(i) = (-1)^(i+1) * egn17.HPs.j_fl(i);
% end
% for i = 1:3
% egn17.HPs.k_fr(i) = (-1)^(i+1) * egn17.HPs.k_fl(i);
% end
% for i = 1:3
% egn17.HPs.t_fr(i) = (-1)^(i+1) * egn17.HPs.t_fl(i);
% end
%% Rear suspension
%Left side
egn17.HPs.a_rl = (xlsread(Table,'Rear Suspension','K15:M15'))';
egn17.HPs.b_rl = (xlsread(Table,'Rear Suspension','K14:M14'))';
egn17.HPs.c_rl = (xlsread(Table,'Rear Suspension','K18:M18'))';
egn17.HPs.d_rl = (xlsread(Table,'Rear Suspension','K17:M17'))';
egn17.HPs.e_rl = (xlsread(Table,'Rear Suspension','K16:M16'))';
egn17.HPs.f_rl = (xlsread(Table,'Rear Suspension','K19:M19'))';
egn17.HPs.g_rl = (xlsread(Table,'Rear Suspension','K26:M26'))';
egn17.HPs.h_rl = (xlsread(Table,'Rear Suspension','K28:M28'))';
egn17.HPs.i_rl = (xlsread(Table,'Rear Suspension','K29:M29'))';
egn17.HPs.j_rl = (xlsread(Table,'Rear Suspension','K30:M30'))';
% egn17.HPs.k_rl = (xlsread(Table,'Rear Suspension','K31:M31'))';
% egn17.HPs.t_rl = (xlsread(Table,'Rear Suspension','K27:M27'))';

%%
%Right side
for i = 1:3
egn17.HPs.a_rr(i) = (-1)^(i+1) * egn17.HPs.a_rl(i);
end
for i = 1:3
egn17.HPs.b_rr(i) = (-1)^(i+1) * egn17.HPs.b_rl(i);
end
for i = 1:3
egn17.HPs.c_rr(i) = (-1)^(i+1) * egn17.HPs.c_rl(i);
end
for i = 1:3
egn17.HPs.d_rr(i) = (-1)^(i+1) * egn17.HPs.d_rl(i);
end
for i = 1:3
egn17.HPs.e_rr(i) = (-1)^(i+1) * egn17.HPs.e_rl(i);
end
for i = 1:3
egn17.HPs.f_rr(i) = (-1)^(i+1) * egn17.HPs.f_rl(i);
end
for i = 1:3
egn17.HPs.g_rr(i) = (-1)^(i+1) * egn17.HPs.g_rl(i);
end
for i = 1:3
egn17.HPs.h_rr(i) = (-1)^(i+1) * egn17.HPs.h_rl(i);
end
for i = 1:3
egn17.HPs.i_rr(i) = (-1)^(i+1) * egn17.HPs.i_rl(i);
end
for i = 1:3
egn17.HPs.j_rr(i) = (-1)^(i+1) * egn17.HPs.j_rl(i);
end
% for i = 1:3
% egn17.HPs.k_rr(i) = (-1)^(i+1) * egn17.HPs.k_rl(i);
% end
% for i = 1:3
% egn17.HPs.t_rr(i) = (-1)^(i+1) * egn17.HPs.t_rl(i);
% end
clear i Table
