


% Date: 14 October, 2006
% Place: research Lab DoS in CS
% Function: funRGB2YUV();
% Decripition: Function to convert RGB to HSV.
% From RGB to YUV   Y = 0.299R + 0.587G + 0.114B   U = 0.492 (B-Y)   V = 0.877 (R-Y) 
% It can also be represented as:   Y =  0.299R + 0.587G + 0.114B   U = -0.147R - 0.289G + 0.436B   V =  0.615R - 0.515G - 0.100B   
% From YUV to RGB   R = Y + 1.140V   G = Y - 0.395U - 0.581V   B = Y + 2.032U
%
%--------------------------- Function begins here %------------------------
function [yuvImage] = funRGB2YUV(rgbImage)

R = rgbImage(:,:,1);
G = rgbImage(:,:,2);
B = rgbImage(:,:,3);

Y = R * 0.299 + G * 0.587 + B * 0.114;
U = R * (-0.169) + G * (-0.332) + B * (0.500) + 128;
V = R * 0.500 + G * (-0.419) + B * (-0.0813) + 128;

yuvImage(:,:,1) = Y;
yuvImage(:,:,2) = U;
yuvImage(:,:,3) = V;

% subplot(2,2,1);imshow(Y); 
% subplot(2,2,2);imshow(U); 
% subplot(2,2,3);imshow(V); 


%--------------------------- Function ends here %--------------------------
