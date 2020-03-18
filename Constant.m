%% Car dimensional Parameter
Constants.dim_param.g=9.81;
Constants.dim_param.cg_height=0.313;
Constants.dim_param.wheel_base=1.53;
Constants.dim_param.dist_cg_rear=0.6838;
Constants.dim_param.dist_cg_front=1.53-0.6838;
Constants.dim_param.front_track=1.2;
Constants.dim_param.rear_track=1.15;

%% Car Mass Parameter
Constants.mass_param.car_mass=270;
Constants.mass_param.front_weight_distribution=50;
Constants.mass_param.front_unsprung_mass=29.1;
Constants.mass_param.rear_unsprung_mass=29.16;
Constants.mass_param.sprung_mass=211.74;

%% Car point of impact of Mass Parameter
Constants.dim_param_mass.height_front_unsprung_cg=0.0007 + 0.23525;  %Front Unsprung Mass CG in m (z coordinate)
Constants.dim_param_mass.height_rear_unsprung_cg=0.0027 + 0.23525;   %Rear Unsprungit g Mass CG in m (z coordinate)
Constants.dim_param_mass.distance_of_sprung_cg_from_front_axle=1.53-0.665;     %Distance of Sprung CG from Front Axle in m
Constants.dim_param_mass.distance_of_sprung_cg_from_rear_axle=0.655;                         %Distance of Sprung CG from Rear Axle in m
Constants.dim_param_mass.distance_sprung_mass_cg_and_roll_axis=0.1854;     %Perpendicular Distance Between Sprung Mass CG and Roll Axis

%% Car roll parameters

Constants.roll_param.front_roll_center_height=0.0575;              %Front Roll Center Height (in m)
Constants.roll_param.rear_roll_center_height=0.0792;               %Rear Roll Center Height (in m)
Constants.roll_param.front_roll_stiffness=268;                     %Front Roll stiffness
Constants.roll_param.rear_roll_stiffness=277;                      %Rear Roll stiffness
% modified_front_roll_rate=front_roll_rate-(((distance_of_sprung_cg_from_rear_axle)*sprung_mass_car*g*distance_sprung_mass_cg_and_roll_axis)/wheel_base); 
% modified_rear_roll_rate=(rear_roll_rate-((distance_of_sprung_cg_from_front_axle*sprung_mass_car*g*distance_sprung_mass_cg_and_roll_axis)/(wheel_base))); 

%% Car Aerodynamic Parameter

Constants.aero_param.density_air=1.225;                            %Density of air at the specific ground level
Constants.aero_param.frontal_area=1.2;                             %Frontal area of the front&rear wing
% rear_cd=;                                   %coefficient of drag in the rear of the car
% front_cl=;                                  %coefficient of lift in the front of the car
% rear_cl=;   

%% car Point of Impact of Aero Dynamic parameters
% front_drag_impact_height=;                  %Height from the ground in the front of the car where the front drag and lift force is acting
% front_drag_impact_length=;                  %Length between the front wheel axel to the point where the front drag and lift force acts
% rear_drag_impact_height=;                   %Height from the ground in the rear of the car where the front drag and lift force is acting
% rear_drag_impact_length=;                   %Length between the rear wheel axel to the point where the front drag and lift force acts
Constants.aero_param.front_force=543.6;
Constants.aero_param.rear_force=552.34;

%% Torque and Speed
Constants.driving_param.front_peak_torque=21;
Constants.driving_param.rear_peak_torque=21;
Constants.driving_param.front_peak_speed=16900*0.10471975511965977;
Constants.driving_param.rear_peak_speed=16900*0.10471975511965977;
Constants.driving_param.gear_ratio=14;

%% Wheel Parameters.
Constants.wheel_param.wheel_radius=0.2355;
Constants.wheel_param.Tire_cornering_stiffness_rear =553.706;
Constants.wheel_param.Tire_cornering_stiffness_front =553.706;

%% Road Paramaters
%% Dry asphalt 
Constants.road_param.dry.C1=1.2801;
Constants.road_param.dry.C2=23.99;
Constants.road_param.dry.C3=0.52;
%% Wet asphalt
% Constants.road_param.wet.C1=0.857;
% Constants.road_param.wet.C2=33.82;
% Constants.road_param.wet.C3=0.347;
%% Snow 
% Constants.road_param.snow.C1=1.946;
% Constants.road_param.snow.C2=94.12;
% Constants.road_param.snow.c3=0.0646;
%% Ice 
% Constants.road_param.ice.C1=0.05; 
% Constants.road_param.ice.C2=306.3; 
% Constants.road_param.ice.C3=0;

%% other
% Kp=1;
% Ki=0.1;
Constants.other_param.Moment_of_Inertia=131.55;
Constants.other_param.Friction_Tuning_Parameter=0.8;
Constants.other_param.Mew_max=3.0;
Driving_Factor=0;


%% Controller gain design 1(SkidPad)

Constants.cont_param.k_stan=-10;
Constants.cont_param.k_yaw=-1;
Constants.cont_param.k_soft=0.1;
Constants.cont_param.k_ag=1;
Constants.cont_param.kd_yaw=10;
Constants.cont_param.kd_steer=100;

%% Curve Data SkidPad
load('SkidPad')
Constants.initial_param.X0=10;
Constants.initial_param.Y0=0;
Constants.initial_param.Z0=0;
Constants.initial_param.initialization_velocity=0;
Constants.initial_param.step_val=1;

xy.Xmax = max(max(BezierCurves(:,1,:))) + 5;
xy.Ymax = max(max(BezierCurves(:,2,:))) + 5;
xy.Ymin = min(min(BezierCurves(:,2,:))) - 5;
xy.Xmin = min(min(BezierCurves(:,1,:))) - 5;

%% Controller gain design 1(FSG)

Constants.cont_param.k_stan=-10;
Constants.cont_param.k_yaw=-1;
Constants.cont_param.k_soft=0.1;
Constants.cont_param.k_ag=1.1;
Constants.cont_param.kd_yaw=0.1;
Constants.cont_param.kd_steer=0;
%% Curve Data FSG
%do not use for now
load('FSG')

Constants.initial_param.X0=36.42;
Constants.initial_param.Y0=75.35;
Constants.initial_param.Z0=0;
Constants.initial_param.initialization_velocity=2;
Constants.initial_param.step_val=0.85;

xy.Xmax = max(max(BezierCurves(:,1,:))) + 5;
xy.Ymax = max(max(BezierCurves(:,2,:))) + 5;
xy.Ymin = min(min(BezierCurves(:,2,:))) - 5;
xy.Xmin = min(min(BezierCurves(:,1,:))) - 5;