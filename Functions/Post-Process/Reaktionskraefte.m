function [Forces] = Reaktionskraefte(M_T,F_T,S_UCA,S_LCA,S_T,a,b,c,d,e,f,q,r,S_W,u_f)
syms Fu1 Fu2 Fl1 Fl2 Ft
for i=1:length(S_LCA)
    
% Eigenvektoren der Fahrwerksstangen
r_ac_C=a+S_LCA(:,:,i)*(c-a);
r_bc_C=b+S_LCA(:,:,i)*(c-b);
r_df_C=d+S_UCA(:,:,i)*(f-d);
r_ef_C=e+S_UCA(:,:,i)*(f-e);
r_C=r+[0;u_f;0];
r_rq_C=b+r_bc_C+S_T(:,:,i)*(q-c)-r_C;

e_ac_C=1/norm(r_ac_C) *r_ac_C;
e_bc_C=1/norm(r_bc_C) *r_bc_C;
e_df_C=1/norm(r_df_C) *r_df_C;
e_ef_C=1/norm(r_ef_C) *r_ef_C;
e_rq_C=1/norm(r_rq_C) *r_rq_C;

%Ortsvektoren vom Radaufstandspunkt zu den HPs am Radträger
r_W=S_W+[0;0;-0.23525];
r_l=r_ac_C-r_W;
r_u=r_df_C-r_W;
r_t=r_rq_C-r_W;

T=[-F_T(i,:)';-M_T(i,:)'];

eqn = T == [Fl1*e_ac_C+Fl2*e_bc_C+Fu1*e_df_C+Fu2*e_ef_C+Ft*e_rq_C;...
            cross(r_l,Fl1*e_ac_C+Fl2*e_bc_C)+cross(r_u,Fu1*e_df_C+Fu2*e_ef_C)+cross(r_t,Ft*e_rq_C)];
Forces(:,i) = solve(eqn,[Fl1,Fl2,Fu1,Fu2]);
end
end