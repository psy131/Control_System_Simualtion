function psi = trigon(a,b,c)
%Solve a*cos(psi) + b*sin(psi) = c

y = max(min(c/sqrt(a^2+b^2),1),-1);

if b < 0
    psi = asin(-y) - atan2(-a,-b);
else
    psi = asin(y) - atan2(a,b);
end
end

