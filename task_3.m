% Lab1_3
clear; close all;
 
% Task 1
img = imread ('lyceum.jpg');
img = imrotate (img, 90);
subplot (2,3,1), imshow (img);
title ('Task 3.1')
 
% Task 2
subplot (2,3,2), imshow (rgb2gray (img));
title ('Task 3.2')
 
% Task 3
subplot (2,3,3), imshow (im2bw (img));
title ('Task 3.3')
 
% Task 4
subplot (2,3,4), imshow (img (:,:, 1));
title ('Task 3.4')
 
% Task 5
subplot (2,3,5), imshow (img (:,:, 2));
title ('Task 3.5')
 
% Task 6
subplot (2,3,6), imshow (img (:,:, 3));
title ('Task 3.6')
 
% Task 7
f_info = imfinfo ('lyceum.jpg');
 
% We form image channels according to the task
fn = fieldnames (f_info);
tf = cellfun (@ (c) isempty (f_info. (c)), fn);
f_info = rmfield (f_info, fn (tf));
 
disp (f_info); % Merge channels and display