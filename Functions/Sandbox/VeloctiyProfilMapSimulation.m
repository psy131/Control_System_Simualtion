function VeloctiyProfilMapSimulation(rawPositionX, rawPositionY, rawVelocityX, colorReferenceSpeed, lapTime)

    plot (rawPositionX, rawPositionY);



    positionXLength = length(rawPositionX);

    positionYLength = length(rawPositionY);

    velocityXLength = length(rawVelocityX);

    

    maxVectorLength = 0;

    if positionXLength < positionYLength

        maxVectorLength = positionXLength;

    else

        maxVectorLength = positionYLength;

    end

    

    if velocityXLength < maxVectorLength

       maxVectorLength = velocityXLength; 

    end



    positionX = rawPositionX(1:maxVectorLength);

    positionX = positionX.';



    positionY = rawPositionY(1:maxVectorLength);

    positionY = positionY.';



    velocityX = rawVelocityX(1:maxVectorLength);

    velocityX = velocityX.';

    

%     velocityX(1) = 0;

%     velocityX(length(velocityX)) = colorReferenceSpeed;



    z = zeros(size(positionX));

    col = velocityX ;%.* 2;  % This is the color, vary with x in this case.

    surface([positionX;positionX],[positionY;positionY],[z;z],[col;col],...
            'facecol','no',...
            'edgecol','interp',...
            'linew',2);



    title(['Position and Velocity - Lap time: ', num2str(lapTime), ' sec']);

    xlabel('x position [m]') % x-axis label

    ylabel('y position [m]') % y-axis label

    

    maxX = max(positionX);

    minX = min(positionX);



    maxY = max(positionY);

    minY = min(positionY);

    

    lengthX = maxX - minX;

    lengthY = maxY - minY;

    

    if lengthX > lengthY

       maxY = maxY + lengthX - lengthY;

    else

       maxX = maxX + lengthY - lengthX;

    end

    

    axis([minX - 2, maxX + 2, minY - 2, maxY + 2]);

    

    daspect([1 1 1]);

end

