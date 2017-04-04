% imread('inpath') will read in the uploaded image file
I = imread('static/images/in');

% this line does a simple Gaussian blur
O = imgaussfilt(I, 10);
% if the filter were more complicated we'd do more here

% imwrite(imagevariable, 'outpath') will write out the transformed file
imwrite(O, 'static/images/out.png');

