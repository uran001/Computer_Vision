clear all;
%imname = ['/home/uran001/Desktop/Academic 2021 Fall/Computer Vision/Assignment 1/data/data/00125v.jpg'];
img = (imread('/home/uran001/Desktop/Academic 2021 Fall/Computer Vision/Asignment 1/data/data_hires/01047u.tif'));

[Height, width] = size(img);
b = double(img(1:3218,1:width));
g = double(img(3219:6436,1:width));
r = double(img(6437:9654,1:width));

part = 3218; 

[shiftr_row, shiftr_col] = get(double(g(part / 2 - 225:part / 2 + 225,width/2-225: width / 2 + 225)), double(r(part / 2 - 225:part / 2 + 225,width/2-225: width / 2 + 225)));
[shiftb_row, shiftb_col] = get(double(g(part / 2 - 225:part / 2 + 225,width/2-225: width / 2 + 225)), double(b(part / 2 - 225:part / 2 + 225,width/2-225: width / 2 + 225)));

shiftr= uint16(circshift(r,[shiftr_row,shiftr_col]));
shiftb = uint16(circshift(b,[shiftb_row,shiftb_col]));
final = cat(3,shiftr,uint16(g),shiftb);

targetsize = [2900 3300];

r = centerCropWindow2d(size(final), targetsize);

cropped = imcrop(final, r);
%figure(3); clf; imshow(final);
figure(4); clf; imshow(cropped);
    
function [shift_row, shift_col] = get(main, temp)
        error = inf;
        for i = -100:100
            for j = -100:100
                shift_temp = circshift(temp,[i,j]);
                temp_error = sum(sum((double(main) - double(shift_temp)) .^ 2));
                if temp_error < error
                    error = temp_error;
                    shift_row = i;
                    shift_col = j;
                end
            end
        end
end
        