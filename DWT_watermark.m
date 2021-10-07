%% Clean up workspace
clear;
load('watermark.mat');

%% Get a grayscale image filename with uigetfile tif or jpg
[filename, pathname] = uigetfile({'*.tif;*.jpg'}, 'pick a file...');

%% Load in the image with imread() and show it in a figure
img = imread(filename);
figure, imshow(img);

%% Embed watermarks 
% go to the second level of decomposition
[A1, H1, V1, D1] = dwt2(double(img),'haar','mode','per');
[A2, H2, V2, D2] = dwt2(A1, 'haar', 'mode','per');

% embed a watermark in each of the second-level sub-bands using embed_watermark function
HW = embed_watermark(H2,w1);
VW = embed_watermark(V2,w2);
DW = embed_watermark(D2,w3);

% reconstruct the image using the new watermarked sub-bands
A1_new = idwt2(A2, HW, VW, DW, 'haar','mode','per' ); 
img_wm = idwt2(A1_new, H1, V1, D1, 'haar','mode','per' );

% convert the image to uint8() and display with imshow()
img_wm = uint8(img_wm);
figure, imshow(img_wm);

%% Detect watermarks
% go to the second level of decomposition
[A1, H1, V1, D1] = dwt2(double(img_wm),'haar','mode','per');
[A2, H2, V2, D2] = dwt2(A1, 'haar', 'mode','per');

% detect watermark in each of the second-level sub-bands using detect_watermark function
if detect_watermark(H2,w1)
    disp('Image contains watermark 1');
else
    disp('Image does NOT contain watermark 1');
end
if detect_watermark(V2,w2)
    disp('Image contains watermark 2');
else
    disp('Image does NOT contain watermark 2');
end
if detect_watermark(D2,w3)
    disp('Image contains watermark 3');
else
    disp('Image does NOT contain watermark 3');
end