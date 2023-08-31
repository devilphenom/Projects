% Date: 2 Feb 2006
% Place: research lab DoS in CS.
% function: To extract features of all the responses produced by
% the gabour filter.

function [NFeatures] = funExtractFeatures(blimg)

NumberOfResponses = size(blimg,3);
Features = 0;
for i = 1 : NumberOfResponses
    if(i == 1)
        Features = funGetEntropyFeatures(blimg(:,:,i));
    else
        Features = cat(1,Features,funGetEntropyFeatures(blimg(:,:,i)));   
    end
end
cols = size(Features,1);
NFeatures = Features(2:cols);
