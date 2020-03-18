function [AeqXY,BeqFull] = calcAB(numberOfCurves,points)

    AeqXY = zeros(numberOfCurves * 3);
    for i = 1:numberOfCurves-1
       n = i * 3 + 1;
       % C1 constraint: P(n+1) = 2 * P(n) - P(n-1)
       AeqXY(n+1,n) = 2;
       AeqXY(n+1,n-1) = -1;
       
       AeqXY(n+1,n+1) = -1;
       
       % C2 constraint: P(n+2) = 2 * P(n+1) - 2 * P(n-1) + P(n-2)
       AeqXY(n+2,n+1) = 2;
       AeqXY(n+2,n-1) = -2;
       AeqXY(n+2,n-2) = 1;
       
       AeqXY(n+2,n+2) = -1;
       
    
    end
    
    % Set centerpoints of function to constant
    for i = 0:numberOfCurves - 1       
        n = i * 3 + 1;
        AeqXY(n,n) = 1;        
    end
       
    % too avoid running out of bounds, first index has to be filled
    % manually
    AeqXY(2,1) = 2;
    AeqXY(2,numberOfCurves * 3) = -1;
    
    AeqXY(2,2) = -1;
    AeqXY(3,2) = 2;
    AeqXY(3,numberOfCurves * 3) = -2;
    AeqXY(3,numberOfCurves * 3 - 1) = 1;
    
    AeqXY(3,3) = -1;
    
%     BeqFull = zeros(numberOfCurves * 6,1);
%     for i = 0:numberOfCurves - 1        
%         n = i * 3 + 1;
%         BeqFull(n) = points(i+1,1);
%         BeqFull(numberOfCurves * 3 + n) = points(i+1,2);        
%     end 
    
    BeqFull = zeros(numberOfCurves * 3,1);
    for i = 0:numberOfCurves - 1        
        n = i * 3 + 1;
        BeqFull(n,1) = points(i+1,1);
        BeqFull(n,2) = points(i+1,2);        
    end 
    
end