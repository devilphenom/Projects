



function [DCTCoefficients DCTCoefficients1] = funColorLayoutExtract(Image, NumberOfBlockPartition)
% Function to extract the color layout descriptor : MPEG-7 
% Author: Manjunath S  
%         Research Scholar
%         Department of Studies in Computer Science
%         University of Mysore, Mysore. 
% 

% Convert Image from RGB space to YCbCr model 
YCbCrImage = rgb2ycbcr(Image);

% Extract coefficient for each channel of YCbCr
DCTCoefY = funColorLayout(YCbCrImage(:,:,1), NumberOfBlockPartition, 1);
DCTCoefCb = funColorLayout(YCbCrImage(:,:,2), NumberOfBlockPartition, 1);
DCTCoefCr = funColorLayout(YCbCrImage(:,:,3), NumberOfBlockPartition, 1);

% Concatinate all the coefficients 

DCTCoefficients = cat(1,DCTCoefY,DCTCoefCb,DCTCoefCr);
DCTCoefficients1= horzcat(DCTCoefY',DCTCoefCb',DCTCoefCr');


