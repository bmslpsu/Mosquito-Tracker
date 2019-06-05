clc
clear all

%% loads the file names into matlab
root='S:\Restricted\WS\Mosquito_data\';
[files, dirpath] = uigetfile({'*.mat', 'MAT-files'},...
    'Pick files for computing threshold', root,'MultiSelect','on');
load([root files])
%% start the tracking
%% find the POI in the reference image
Image_ref=spin(:,:,54);
imshow(Image_ref)
points_ref = detectKAZEFeatures(Image_ref);
hold on
plot(selectStrongest(points_ref,1))

%%
Image_mov=spin(:,:,100);
figure
imshow(Image_mov)
points_mov = detectKAZEFeatures(Image_mov);
hold on
plot(selectStrongest(points_mov,1))
figure
montage({Image_ref,Image_mov})