% Lab1_5
clear; close all;
 
IMG_SIZE = 200;
CIRCLE_DIAM = 100;
OFFSET = [0.1 0.25 0.4] * IMG_SIZE; % Offsets for squares
 
R = CIRCLE_DIAM / 2; % Radius of the circle
Circles = uint8 (zeros (IMG_SIZE, IMG_SIZE, 3)); % Create a black RGB canvas
 
COORDS_RANGE = 1: IMG_SIZE;
for i = 1: 3
    
    CENTER = R + OFFSET (i);
    [x, y] = meshgrid (COORDS_RANGE - CENTER);
    
    % Matrix of points included in the circle
    CircleExistance = x.^2 + y.^2 <= (R)^2;
    
    % Fill in the appropriate canvas channel
    for cX = 1: IMG_SIZE
        for cY = 1: IMG_SIZE
            % Check to enter the circle
            if CircleExistance (cX, cY)
                Circles (cX, cY, i) = uint8 (255);
            end
        end
    end
    
end
 
imwrite (Circles, 'Circles.tiff', 'tiff');
 
% Task 1
START_CROP = IMG_SIZE / 10; % Initial cropping coordinates (x, y)
END_CROP = IMG_SIZE - START_CROP * 2; % Final coordinates (width, height)
CirclesCad = imcrop (Circles, [START_CROP, START_CROP, END_CROP, END_CROP]);
 
% Task 2
subplot (2,3,1), imshow (Circles)
title ('Initial image')
 
subplot (2,3,2), imshow (CirclesCad)
title ('Cropped Image')
 
% Task 3
CirclesCadDec = CirclesCad (1: 2: end, 1: 2: end, 1: end);
subplot (2,3,3), imshow (CirclesCadDec)
title ('Decimation result')
 
% Task 4
CirclesCadDec2 = imresize (CirclesCadDec, 2, 'bicubic');
subplot (2,3,4), imshow (CirclesCadDec2)
title ('Enlarged decimated image')
 
% Task 5
CirclesCadRot90 = rot90 (CirclesCad);
subplot (2,3,5), imshow (CirclesCadRot90);
title ('Rotated 90º decimated image')
 
% Task 6
CirclesCadRot45 = imrotate (CirclesCad, 45, 'bilinear');
subplot (2,3,6), imshow (CirclesCadRot45);
title ('Rotated to 45º decimated image')