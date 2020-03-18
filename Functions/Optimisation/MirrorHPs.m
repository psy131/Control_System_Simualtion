function [egn17] = MirrorHPs(egn17)
%MIRRORHPS Summary of this function goes here
%   Detailed explanation goes here
    fields=fieldnames(egn17.HPs);
    strings=string(fields);
    n=cell2mat(strfind(strings,"fl"))>0;
    m=cell2mat(strfind(strings,"rl"))>0;
    for i=1:sum(n)
        for j=1:3
            egn17.HPs.(fields{i+sum(n)})(j)=egn17.HPs.(fields{i})(j)*(-1)^(1+j);
        end
    end
    for i=2*sum(n)+1:2*sum(n)+sum(m)
        for j=1:3
            egn17.HPs.(fields{i+sum(m)})(j)=egn17.HPs.(fields{i})(j)*(-1)^(1+j);
        end
    end
    egn17.HPs.l_rr(3)=egn17.HPs.h_rl(3)-(egn17.HPs.l_rl(3)-egn17.HPs.h_rl(3));
end