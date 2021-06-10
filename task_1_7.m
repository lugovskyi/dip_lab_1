clear; close all

% Setting the values of variables 
A = 256; % Color depth 
N = 200; % The width and height of the image matrix 
s = 4; % Size
i = 1:N;
r = 0.1 * (i - N / 2);% forming an image matrix according to the corresponding formula 
f = exp(-r.^2/2/s^2);
M = A * (f' * f);


% 1 task
colormap(subplot(2,3,1), 'Jet'), image(M);
axis('image');
title("Indexed image (Palette Jet)");

% 2 task
subplot(2,3,2), subimage(ind2gray(uint8(M),jet(256)));
title("Shades of gray (by subimage)");

% 3 task
subplot(2,3,3), imshow(ind2gray(uint8(M),jet(256)));
title("Shades of gray (by imshow)");

% 4 task
subplot(2,3,4), imshow(ind2gray(uint8(M),hsv));
title("Shades of gray (palette hsv)");

% 5 tasks
subplot(2,3,5), imshow(im2bw(uint8(M), hot));
title("Indexed image (Palette hot)");

% 6 tasks
Mr=M;
Mg=256-M;
Mb=(2^8)*cos(2*pi*log(M))^3;
im = cat(3, Mr, Mg, Mb);
subplot(2,3,6), imshow(uint8(im));
title("Colored image")
