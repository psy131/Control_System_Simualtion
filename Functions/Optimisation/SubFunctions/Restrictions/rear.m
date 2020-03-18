function [egn17,max,min] = rear(egn17)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
test=4e-2;
max.xmax.a_rl=-0.0628+test;
max.xmax.b_rl=0.2867+test;
max.xmax.c_rl=-0.0245+test;
max.xmax.d_rl=-0.0628+test;
max.xmax.e_rl=0.2867+test;
max.xmax.f_rl=-0.0457+test;

max.ymax.a_rl=0.2769+test;
max.ymax.b_rl=0.2760+test;
max.ymax.c_rl=0.53+test;
max.ymax.d_rl=0.276+test;
max.ymax.e_rl=0.276+test;
max.ymax.f_rl=0.4782+test;

max.zmax.a_rl=-0.1298+test;
max.zmax.b_rl=-0.096+test;
max.zmax.c_rl=-0.1103+test;
max.zmax.d_rl=0.0156+test;
max.zmax.e_rl=0.0271+test;
max.zmax.f_rl=0.11;

min.xmin.a_rl=-0.0628-test;
min.xmin.b_rl=0.2867-test;
min.xmin.c_rl=-0.0245-test;
min.xmin.d_rl=-0.0628-test;
min.xmin.e_rl=0.2867-test;
min.xmin.f_rl=-0.0457-test;

min.ymin.a_rl=0.2769-test;
min.ymin.b_rl=0.2760-test;
min.ymin.c_rl=0.53-test;
min.ymin.d_rl=0.276-test;
min.ymin.e_rl=0.276-test;
min.ymin.f_rl=0.45;

min.zmin.a_rl=-0.1298-test;
min.zmin.b_rl=-0.096-test;
min.zmin.c_rl=-0.1103-test;
min.zmin.d_rl=0.0156-test;
min.zmin.e_rl=0.0271-test;
min.zmin.f_rl=0.1106-test;

fieldHPs=RemoveHPfromRestrictionsRear(fieldnames(egn17.HPs));
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

