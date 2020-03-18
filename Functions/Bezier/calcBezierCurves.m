function bezierCurves = calcBezierCurves(trackName)
    
    % Position Accuracy in Meter
    prescision = 0.001;
    % maximum Waypoint shift in Meter
    trackwidh = 1;
    % weights for function
    % weights(1) : curvature
    % weights(2) : change in curvature
    % weights(3) : length of track
    weights = [1, 1, 0];
           
           
    currentPath = pwd;
    cd([currentPath '\TrackDataBezierFitting'])
%     points = trackDemo;
    points = eval(trackName);
%    points = trackDrive2;
    cd([currentPath '\subFunctionsBezierFitting']);        
            

    for j = 1:1:numel(trackwidh) 
        %% Evaluation of given Points and Constraints
        tic
        [bezierCurves,cost,numBi]  = psoinit(points,trackwidh(j),prescision,weights(j,:));
        %fittedData = fitBezierFullyInCostfunctionOnlyLineConst(trackCenterline);
        %test = fittedDataNew - fittedData
        toc
        disp(['Cost of : ' num2str(cost) ' after ' num2str(numBi) ' bisections to a prescision of ' num2str(prescision) ' . ']);
        figure(5)
        plot(points(:,1),points(:,2),'k*')
        hold on
        colorArray = ['r','b','m','k','g'];
        plotBezierCurves(bezierCurves,colorArray(j))
    end
    %plotTangentNormal(bezierCurves)

    cd(currentPath);
end