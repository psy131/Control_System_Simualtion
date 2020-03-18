function [fields] = RemoveHPforScattering(fields)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
        %front right
        fields(ismember(fields,'a_fr'))=[];
        fields(ismember(fields,'b_fr'))=[];
        fields(ismember(fields,'c_fr'))=[];
        fields(ismember(fields,'d_fr'))=[];
        fields(ismember(fields,'e_fr'))=[];
        fields(ismember(fields,'f_fr'))=[];
        fields(ismember(fields,'g_fr'))=[];
        fields(ismember(fields,'h_fr'))=[];
        fields(ismember(fields,'i_fr'))=[];
        fields(ismember(fields,'j_fr'))=[];
        fields(ismember(fields,'k_fr'))=[];
        fields(ismember(fields,'l_fr'))=[];
        fields(ismember(fields,'m_fr'))=[];
        fields(ismember(fields,'n_fr'))=[];
        fields(ismember(fields,'o_fr'))=[];
        fields(ismember(fields,'p_fr'))=[];
        fields(ismember(fields,'q_fr'))=[];
        fields(ismember(fields,'r_fr'))=[];
        fields(ismember(fields,'s_fr'))=[];
        fields(ismember(fields,'t_fr'))=[];
        fields(ismember(fields,'u_fr'))=[];
        fields(ismember(fields,'w_fr'))=[];
        
        %rear right
        fields(ismember(fields,'a_rr'))=[];
        fields(ismember(fields,'b_rr'))=[];
        fields(ismember(fields,'c_rr'))=[];
        fields(ismember(fields,'d_rr'))=[];
        fields(ismember(fields,'e_rr'))=[];
        fields(ismember(fields,'f_rr'))=[];
        fields(ismember(fields,'g_rr'))=[];
        fields(ismember(fields,'h_rr'))=[];
        fields(ismember(fields,'i_rr'))=[];
        fields(ismember(fields,'j_rr'))=[];
        fields(ismember(fields,'k_rr'))=[];
        fields(ismember(fields,'l_rr'))=[];
        fields(ismember(fields,'m_rr'))=[];
        fields(ismember(fields,'n_rr'))=[];
        fields(ismember(fields,'o_rr'))=[];
        fields(ismember(fields,'p_rr'))=[];
        fields(ismember(fields,'q_rr'))=[];
        fields(ismember(fields,'r_rr'))=[];
        fields(ismember(fields,'s_rr'))=[];
        fields(ismember(fields,'t_rr'))=[];
        fields(ismember(fields,'u_rr'))=[];       
        fields(ismember(fields,'w_rr'))=[]; 
        
        %front left
%         fields(ismember(fields,'a_fl'))=[];
%         fields(ismember(fields,'b_fl'))=[];
%         fields(ismember(fields,'c_fl'))=[];
%         fields(ismember(fields,'d_fl'))=[];
%         fields(ismember(fields,'e_fl'))=[];
%         fields(ismember(fields,'f_fl'))=[];
        fields(ismember(fields,'g_fl'))=[];
        fields(ismember(fields,'h_fl'))=[];
        fields(ismember(fields,'i_fl'))=[];
        fields(ismember(fields,'j_fl'))=[];
        fields(ismember(fields,'k_fl'))=[];
        fields(ismember(fields,'l_fl'))=[];
        fields(ismember(fields,'m_fl'))=[];
        fields(ismember(fields,'n_fl'))=[];
        fields(ismember(fields,'o_fl'))=[];
        fields(ismember(fields,'p_fl'))=[];
%         fields(ismember(fields,'q_fl'))=[];
%         fields(ismember(fields,'r_fl'))=[];
        fields(ismember(fields,'s_fl'))=[];
        fields(ismember(fields,'t_fl'))=[];
        fields(ismember(fields,'u_fl'))=[];
        fields(ismember(fields,'w_fl'))=[];
        %rear left
%         fields(ismember(fields,'a_rl'))=[];
%         fields(ismember(fields,'b_rl'))=[];
%         fields(ismember(fields,'c_rl'))=[];
%         fields(ismember(fields,'d_rl'))=[];
%         fields(ismember(fields,'e_rl'))=[];
%         fields(ismember(fields,'f_rl'))=[];
        fields(ismember(fields,'g_rl'))=[];
        fields(ismember(fields,'h_rl'))=[];
        fields(ismember(fields,'i_rl'))=[];
        fields(ismember(fields,'j_rl'))=[];
        fields(ismember(fields,'k_rl'))=[];
        fields(ismember(fields,'l_rl'))=[];
        fields(ismember(fields,'m_rl'))=[];
        fields(ismember(fields,'n_rl'))=[];
        fields(ismember(fields,'o_rl'))=[];
        fields(ismember(fields,'p_rl'))=[];
%         fields(ismember(fields,'q_rl'))=[];
%         fields(ismember(fields,'r_rl'))=[];
        fields(ismember(fields,'s_rl'))=[];
        fields(ismember(fields,'t_rl'))=[];
        fields(ismember(fields,'u_rl'))=[];
        fields(ismember(fields,'w_rl'))=[];
end

