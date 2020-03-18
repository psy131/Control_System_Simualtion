function [AD_f,AD_r,AS_f,AS_r] = AD_AS(f_f,d_f,e_f,a_f,b_f,c_f,...
                                       f_r,d_r,e_r,a_r,b_r,c_r,...
                                       S_Wfl,S_Wrl,...
                                       COG_heigt,break_distribution,accel_distribution,...
                                       S_UCA_fl,...
                                       S_LCA_fl,...
                                       S_UCA_rl,...
                                       S_LCA_rl)
%% Front
% Transform Upright HPs for dynamic calculation
af=a_f;
cf=c_f;
df=d_f;
ff=f_f;
ar=a_r;
cr=c_r;
dr=d_r;
fr=f_r;
a_f(2)=[];
b_f(2)=[];
e_f(2)=[];
d_f(2)=[];
a_r(2)=[];
b_r(2)=[];
e_r(2)=[];
d_r(2)=[];
AD_f=zeros(length(S_UCA_fl),1);
AD_r=zeros(length(S_UCA_fl),1);
AS_f=zeros(length(S_UCA_fl),1);
AS_r=zeros(length(S_UCA_fl),1);
for i=1:length(S_UCA_fl)
    f_f_C = df+S_UCA_fl(:,:,i)*(ff-df);
    c_f_C = af+S_LCA_fl(:,:,i)*(cf-af);
    f_f_C(2)=[];
    c_f_C(2)=[];

    y = linsolve([a_f-b_f , e_f-d_f],f_f_C-c_f_C);
    Q_f = c_f_C+y(1)*(a_f-b_f);
    AD_f(i)=(1-break_distribution)*S_Wfl(1)*1/COG_heigt *Q_f(2)/(Q_f(1)-S_Wfl(1));
    AS_f(i)=(1-accel_distribution)*S_Wfl(1)*1/COG_heigt *Q_f(2)/(Q_f(1)-S_Wfl(1));

    %% Rear
    % Transform Upright HPs for dynamic calculation 
    f_r_C = dr+S_UCA_rl(:,:,i)*(fr-dr);
    c_r_C = ar+S_LCA_rl(:,:,i)*(cr-ar);
    f_r_C(2)=[];
    c_r_C(2)=[];


    y = linsolve([a_r-b_r , e_r-d_r],f_r_C-c_r_C);
    Q_r = c_r_C+y(1)*(a_r-b_r);
    AD_r(i)=break_distribution*S_Wrl(1)*1/COG_heigt *Q_r(2)/(Q_r(1)-S_Wrl(1));
    AS_r(i)=accel_distribution*S_Wrl(1)*1/COG_heigt *Q_r(2)/(Q_r(1)-S_Wrl(1));
end
end