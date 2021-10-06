clear all;
%imname = ['/home/uran001/Desktop/Academic 2021 Fall/Computer Vision/Assignment 1/data/data/00125v.jpg'];
img = (imread('/home/uran001/Desktop/Academic 2021 Fall/Computer Vision/Asignment 1/data/data/00153v.jpg'));

[Height, Width] = size(img);
b = double(img(1:341,1:Width));
g = double(img(342:682,1:Width));
r = double(img(683:1023,1:Width));

part = 341/3;
[shiftr_row, shiftr_col] = get(double(g(147:197,175:225)), double(r(147:197,175:225)));
[shiftb_row, shiftb_col] = get(double(g(147:197,175:225)), double(b(147:197,175:225)));

shiftr= uint8(circshift(r,[shiftr_row,shiftr_col]));
shiftb = uint8(circshift(b,[shiftb_row,shiftb_col]));
final = cat(3,shiftr,uint8(g),shiftb);

targetsize = [300 350];

r = centerCropWindow2d(size(final), targetsize);

cropped = imcrop(final, r);
figure(3); clf; imshow(final);
figure(4); clf; imshow(cropped);
    
function [shift_row, shift_col] = get(main, temp)
        error = inf;
        for i = -20:20
            for j = -20:20
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
        