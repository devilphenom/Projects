


% Date: 13 October, 2006.
% Place: Research Lab DoS in CS.
% Function: funGetSecondMoment().
% Descrition: Function to calculate the second order moment.
%----------------------- Function begins here -----------------------------

function [SecondMoment] = funGetSecondMoment(ImageComponent)

IFirstMoment = funGetFirstMoment(ImageComponent); % get the first order moment

ImageComponent  = double(ImageComponent);
rows = size(ImageComponent,1);
cols = size(ImageComponent,2);

summation = 0;
for i = 1 : rows
    for j = 1 : cols
        summation = summation + (ImageComponent(i,j) - IFirstMoment)^2;
    end
end

InsideValue = summation / (rows * cols);

SecondMoment  = sqrt(InsideValue);
    


%----------------------- Function ends here -------------------------------