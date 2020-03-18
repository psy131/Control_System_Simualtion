function [egn17,max,min] = front(egn17)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
test=2e-2;
max.xmax.a_fl=1.3481+test;
max.xmax.b_fl=1.5392+test;
max.xmax.c_fl=1.5189+test;
max.xmax.d_fl=1.283+test;
max.xmax.e_fl=1.6979+test;
max.xmax.f_fl=1.4909+test;
max.xmax.q_fl=1.6+test;
max.xmax.r_fl=1.6+test;


max.ymax.a_fl=0.195+test;
max.ymax.b_fl=0.195+test;
max.ymax.c_fl=0.5438+test;
max.ymax.d_fl=0.239+test;
max.ymax.e_fl=0.239+test;
max.ymax.f_fl=0.5156+test;
max.ymax.q_fl=0.551+test;
max.ymax.r_fl=0.175+test;


max.zmax.a_fl=-0.121+test;
max.zmax.b_fl=-0.121+test;
max.zmax.c_fl=-0.095+test;
max.zmax.d_fl=-0.0215+test;
max.zmax.e_fl=0.0374+test;
max.zmax.f_fl=0.115;
max.zmax.q_fl=-0.1161+test;
max.zmax.r_fl=-0.1335+test;



min.xmin.a_fl=1.3481-test;
min.xmin.b_fl=1.5392-test;
min.xmin.c_fl=1.5189-test;
min.xmin.d_fl=1.283-test;
min.xmin.e_fl=1.6979-test;
min.xmin.f_fl=1.4909-test;
min.xmin.q_fl=1.6-test;
min.xmin.r_fl=1.6-test;

min.ymin.a_fl=0.195-test;
min.ymin.b_fl=0.195-test;
min.ymin.c_fl=0.5438-test;
min.ymin.d_fl=0.239-test;
min.ymin.e_fl=0.239-test;
min.ymin.f_fl=0.5156-test;
min.ymin.q_fl=0.551-test;
min.ymin.r_fl=0.175-test;


min.zmin.a_fl=-0.121-test;
min.zmin.b_fl=-0.121-test;
min.zmin.c_fl=-0.095-test;
min.zmin.d_fl=-0.0215-test;
min.zmin.e_fl=0.0374-test;
min.zmin.f_fl=0.1033-test;
min.zmin.q_fl=-0.1161-test;
min.zmin.r_fl=-0.1335-test;




fieldHPs=RemoveHPfromRestrictionsFront(fieldnames(egn17.HPs));
fieldmin=fieldnames(min);
fieldmax=fieldnames(max);

for i=1:numel(fieldHPs)
   for j=1:numel(fieldmin)
       if egn17.HPs.(fieldHPs{i})(j) < min.(fieldmin{j}).(fieldHPs{i})
           egn17.HPs.(fieldHPs{i})(j) = min.(fieldmin{j}).(fieldHPs{i});
       end
   end
   for j=1:numel(fieldmax)
       if egn17.HPs.(fieldHPs{i})(j) > max.(fieldmax{j}).(fieldHPs{i})
           egn17.HPs.(fieldHPs{i})(j) = max.(fieldmax{j}).(fieldHPs{i});
       end
   end
end

end