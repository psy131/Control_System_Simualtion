function Bezier = convertToBezier(particle)
    numberOfCurves = numel(particle) / 6;
    try
        x = [particle(1:numberOfCurves * 3)',particle(numberOfCurves * 3 + 1:numberOfCurves * 6)';particle(1),particle(numberOfCurves * 3 + 1)];
    catch
        x = [particle(1:numberOfCurves * 3),particle(numberOfCurves * 3 + 1:numberOfCurves * 6);particle(1),particle(numberOfCurves * 3 + 1)];
    end
   
    
    Bezier = zeros(4,2,numberOfCurves);
    
    for i = 1:numberOfCurves
        Bezier(:,:,i) = x((1 + (i-1) * 3):(4 + (i-1) * 3),:);
    end
end