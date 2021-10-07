%% Clean up workspace
clear;
load('watermark.mat');

%% Get a grayscale image filename with uigetfile tif or jpg
[filename, pathname] = uigetfile({'*.tif;*.jpg'}, 'pick a file...');

%% Load in the image with imread() and show it in a figure
img = imread(filename);
figure, imshow(img);

%% Embed watermarks using embed_watermark_DCT function
img_wm = embed_watermark_DCT(img,w1,w2,w3,1.5);

%% Display watermarked image with imshow()
figure, imshow(img_wm);

%% Detect watermarks
% convert image to DCT domain
dct = dct2(double(img_wm));

% get size of watermark (size is equal for w1, w2, w3)
[M,N]=size(w1);

% detect watermark in each of the square regions using detect_watermark function
if detect_watermark(dct(1:M,N+1:2*N),w1)
    disp('Image contains watermark 1');
else
    disp('Image does NOT contain watermark 1');
end
if detect_watermark(dct(M+1:2*M,N+1:2*N),w2)
    disp('Image contains watermark 2');
else
    disp('Image does NOT contain watermark 2');
end
if detect_watermark(dct(M+1:2*M,1:N),w3)
    disp('Image contains watermark 3');
else
    disp('Image does NOT contain watermark 3');
end
