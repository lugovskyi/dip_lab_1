% Lab1_4
clear; close all;
 
% Upload the original photo and display it
img = imread ('birds.jpg');
img = imrotate (img, 90);
img = imrotate (img, 90);
img = imrotate (img, 90);
subplot (2,2,1), imshow (img);
title ('Original Image')
 
% Channels of the original image
R = img (:,:, 1);
G = img (:,:, 2);
B = img (:,:, 3);
 
% Increase the intensity of the red color
subplot (2,2,2), imshow (cat (3, R * 1.5, G, B));
title ('Intensity of red')
 
% Increase the intensity of the green color
subplot (2,2,3), imshow (cat (3, R, G * 1.5, B));
title ('Green Intensity')
 
% Increase the intensity of the blue color
subplot (2,2,4), imshow (cat (3, R, G, B * 1.5));
title ('Blue intensity')