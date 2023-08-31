

% Date: 2 Feb 2007
% Place: Research Lab DoS in CS
% Function: To get the gabor features for the inputed image.


function [Feature] = funExtractGabourFeatures(Image,NumberOfBlocksForImagePartition)

yuvImage = funRGB2YUV(Image);
Y = yuvImage(:,:,1);
U = yuvImage(:,:,2);
V = yuvImage(:,:,3);

YFeatures = funGabourFeature(Y,NumberOfBlocksForImagePartition);
UFeatures = funGabourFeature(U,NumberOfBlocksForImagePartition);
VFeatures = funGabourFeature(V,NumberOfBlocksForImagePartition);

Feature = cat(1,YFeatures, UFeatures, VFeatures);

 