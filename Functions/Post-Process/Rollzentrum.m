function R_z  = Rollzentrum(F_l, D_l, E_l, A_l, B_l, C_l, F_r, D_r, E_r, A_r, B_r, C_r, S_W_l, S_W_r,...
                            S_UCA_l, S_UCA_r, S_LCA_l, S_LCA_r, S_C)
%%Calculation of center of roll vector

%% left side
for i=1:numel(S_UCA_l)
    F_l_C = D_l+S_UCA_l(:,:,i)*(F_l-D_l);
    C_l_C = A_l+S_LCA_l(:,:,i)*(C_l-A_l);

    lambda_luca = (F_l_C(1)-D_l(1))/(E_l(1)-D_l(1));
    lambda_llca = (C_l_C(1)-A_l(1))/(B_l(1)-A_l(1));

    F_l_C(1) = [];
    C_l_C(1) = [];
    DE_l_C = D_l+lambda_luca*(E_l-D_l);
    DE_l_C(1) = [];
    AB_l_C = A_l+lambda_llca*(B_l-A_l);
    AB_l_C(1) = [];
    % figure(1)
    % plot(AB_l_C(1,1),AB_l_C(2,1),'*');
    % hold on;
    % plot(C_l_C(1,1),C_l_C(2,1),'*');
    % plot(F_l_C(1,1),F_l_C(2,1),'*');
    % plot(DE_l_C(1,1),DE_l_C(2,1),'*');
    % x = linspace(0,3);
    % Q = F_l_C+x.*(DE_l_C-F_l_C);
    % plot(Q(1,:),Q(2,:))
    % M = C_l_C+x.*(AB_l_C-C_l_C);
    % plot(M(1,:),M(2,:));

    uca = linsolve([AB_l_C-C_l_C, (F_l_C-DE_l_C)] ,(F_l_C-C_l_C));

    QP_l = F_l_C+uca(2)*(DE_l_C-F_l_C);
    w_l = S_W_l + [0;0;-0.23525];
    w_l(1) = [];
    % plot(QP_l(1,1),QP_l(2,1),'*');18
    % plot(w_l(1,1),w_l(2,1),'*');

    %% right side
    F_r_C = D_r+S_UCA_r(:,:,i)*(F_r-D_r);
    C_r_C = A_r+S_LCA_r(:,:,i)*(C_r-A_r);


    lambda_ruca = (F_r_C(1)-D_r(1))/(E_r(1)-D_r(1));
    lambda_rlca = (C_r_C(1)-A_r(1))/(B_r(1)-A_r(1));

    F_r_C(1) = [];
    C_r_C(1) = [];
    DE_r_C = D_r+lambda_ruca*(E_r-D_r);
    DE_r_C(1) = [];
    AB_r_C = A_r+lambda_rlca*(B_r-A_r);
    AB_r_C(1) = [];
    % figure(1)
    % plot(AB_r_C(1,1),AB_r_C(2,1),'*');
    % hold on;
    % plot(C_r_C(1,1),C_r_C(2,1),'*');
    % plot(F_r_C(1,1),F_r_C(2,1),'*');
    % plot(DE_r_C(1,1),DE_r_C(2,1),'*');
    % Q = F_r_C+x.*(DE_r_C-F_r_C);
    % plot(Q(1,:),Q(2,:))
    % M = C_r_C+x.*(AB_r_C-C_r_C);
    % plot(M(1,:),M(2,:));



    n = linsolve([AB_r_C-C_r_C, -(DE_r_C-F_r_C)] ,F_r_C-C_r_C);
    QP_r = F_r_C+n(2)*(DE_r_C-F_r_C);
    w_r = S_W_r + [0;0;-0.23525];
    w_r(1) = [];
    % plot(QP_r(1,1),QP_r(2,1),'*');
    %% Final step
    % figure(1)
    % plot(w_r(1,1),w_r(2,1),'*');
    % w1 = w_r+x.*(QP_r-w_r);
    % plot(w1(1,:),w1(2,:));
    % w2 = w_l+x.*(QP_l-w_l);
    % plot(w2(1,:),w2(2,:));


    x = linsolve([(QP_r-w_r),-(QP_l-w_l)],w_l-w_r);
    R_z_C = [0;w_r+x(2)*(QP_r-w_r)];
    R_z(:,i) = S_C(:,:,i)^(-1) * R_z_C + [0;0;0.23525];
end

end