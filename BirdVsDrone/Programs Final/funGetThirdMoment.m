

% Date: 13 October, 2006.
% Place: Research Lab DoS in CS.
% Function: funGetThirdMoment().
% Descrition: Function to calculate the third order moment.
%----------------------- Function begins here -----------------------------

function [ThirdMoment] = funGetThirdMoment(ImageComponent)

IFirstMoment = funGetFirstMoment(ImageComponent); % get the first order moment

ImageComponent  = double(ImageComponent);
rows = size(ImageComponent,1);
cols = size(ImageComponent,2);

summation = 0;
for i = 1 : rows
    for j = 1 : cols
        summation = summation + (ImageComponent(i,j) - IFirstMoment)^3;
    end
end

InsideValue = summation / (rows * cols);

ThirdMoment  = nthroot(InsideValue,3);
    


%----------------------- Function ends here -------------------------------
