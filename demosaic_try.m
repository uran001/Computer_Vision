clear all;

input = im2double(imread('/home/uran001/Desktop/Academic 2021 Fall/Computer Vision/Asignment 1/data/mosaic/crayons_mosaic.bmp'));
figure(1); clf; imshow(input(1:480,1:600));
%As it may not fit into uint8 format, so we use double format
%input = im2double(I((1:480), (1:600)));
%Task 1
% rggb format, so 
% [r, g]
% [g, b] 
red = input.*repmat([1 0; 0 0], 240, 300);  
green = input.*repmat([0 1; 1 0], 240, 300);  
blue = input.*repmat([0 0; 0 1], 240, 300);  

% Task2
% As Green is main color it remains same but we compute R-B, B-R values
g_Filter = [0 1 0; 1 0 1; 0 1 0]/4;
r_bFilter = [1 0 1; 0 0 0; 1 0 1]/4;
    
%Applying filter Red-to-Blue and Blue-to-Red values    
red = red + imfilter(red,r_bFilter); 
blue = blue + imfilter(blue,r_bFilter);
red = red + imfilter(red,g_Filter);
green = green + imfilter(green,g_Filter);
blue = blue + imfilter(blue,g_Filter);
        
J(:,:,1)= red; 
J(:,:,2)= green; 
J(:,:,3)= blue; 


figure(2); clf; imshow(J);
%imwrite(J, 'newimg.jpg');



Original= im2double(imread('/home/uran001/Desktop/Academic 2021 Fall/Computer Vision/Asignment 1/data/mosaic/crayons.jpg'));

R = Original(:,:, 1);
G = Original(:,:, 2);
B = Original(:,:, 3);

R = R.^2;
G = G.^2;
B = B.^2;

red = red.^2;
green = green.^2;
blue = blue.^2;

Diff(:,:,1) = R - red;
Diff(:,:,2) = G - green;
Diff(:,:,3) = B - blue;


figure(3); clf; imshow(Diff);




