%Lab1_2
clear; close all;
figure ('Name', ' Task 2')

IMG_SIZE = 200; % Image size
QUAD_SIZE = IMG_SIZE / 2; % Size of squares
OFFSET = [0.1 0.25 0.4] * IMG_SIZE; % Offsets for squares
 
Squares = uint8 (zeros (IMG_SIZE)); % Black canvas for colored squares
QUAD_VEC = 0: IMG_SIZE / 2; % A tuple of pixel offset values for a square
 
% Draw three squares
for i = 1: 3
     xy = OFFSET (i) + QUAD_VEC; % Coordinates of x, y pixels of the square
     Squares (xy, xy, i) = uint8 (255); % Fill in the appropriate channel of the square
end
 
imshow (Squares)