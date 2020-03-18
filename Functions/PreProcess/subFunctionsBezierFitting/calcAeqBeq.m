function [AeqXY,BeqXY] = calcAeqBeq(numberOfCurves)

    AeqXY = zeros(numberOfCurves * 3);
    BeqXY = zeros(numberOfCurves * 3,1);
    for i = 1:numberOfCurves-1
       n = i * 3 + 1;
       % C1 constraint: P(n+1) = 2 * P(n) - P(n-1)
       BeqXY(n+1) = 1;
       AeqXY(n+1,n) = 2;
       AeqXY(n+1,n-1) = -1;
       
       AeqXY(n+1,n+1) = -1;
       
       % C2 constraint: P(n+2) = 2 * P(n+1) - 2 * P(n-1) + P(n-2)
       BeqXY(n+2) = 1;
       AeqXY(n+2,n+1) = 2;
       AeqXY(n+2,n-1) = -2;
       AeqXY(n+2,n-2) = 1;
       
       AeqXY(n+2,n+2) = -1;
    end
    % too avoid running out of bounds, first index has to be filled
    % manually
    BeqXY(2) = 1;
    AeqXY(2,1) = 2;
    AeqXY(2,numberOfCurves * 3) = -1;
    
    AeqXY(2,2) = -1;
    
    BeqXY(3) = 1;
    AeqXY(3,2) = 2;
    AeqXY(3,numberOfCurves * 3) = -2;
    AeqXY(3,numberOfCurves * 3 - 1) = 1;
    
    AeqXY(3,3) = -1;
    
end