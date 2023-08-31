

% Date: 2 Feb 2006
% Place: research lab DoS in CS.
% function: To extract first three moments of all the responses produced by
% the gabour filter.

function [NFeatures] = funExtractMoments(blimg)

NumberOfResponses = size(blimg,3);
Features = 0;
for i = 1 : NumberOfResponses
    FirstMoment = funGetFirstMoment(blimg(:,:,i));
    SecondMoment = funGetSecondMoment(blimg(:,:,i));
    ThirdMoment = funGetThirdMoment(blimg(:,:,i));
    Features = cat(1,Features,FirstMoment,SecondMoment,ThirdMoment);   
end
cols = size(Features,1);
NFeatures = Features(2:cols);

