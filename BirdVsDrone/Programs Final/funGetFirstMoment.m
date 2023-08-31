% Date: 13 October, 2006
% Place: Research Lab DoS in CS.
% Function: funGetFirstMoment()
% Description: funGetFirstMoment calculate the first momet of the image
% coponent that has been segmented from thee entire image.
% The first moment is the average color value in the image

%------------------ Function begins here ----------------------------------

function [FirstMoment] = funGetFirstMoment(ImageComponent)
ImageComponent  = double(ImageComponent);
rows = size(ImageComponent,1);
cols = size(ImageComponent,2);

vSum = 0;
for i = 1 : rows
    for j = 1 : cols
        vSum = vSum + ImageComponent(i,j);
    end
end

FirstMoment = vSum /(rows*cols);
        
%------------------ Function ends here ------------------------------------