


% Date: 2 Feb 2007
% Place: Research Lab in DoS in CS
% Function : To calculate the distnce matrix for given set of features.

function [DistanceMatrix] = funComputeDistanceMatrix(Features)

[rows, cols] = size(Features);
for i = 1 : rows      
    for j = 1 : rows
        if(i == j)
            DistanceMatrix(i,j) = 0;
        else
            summation = 0;
            for k = 1 : cols
                summation = summation + (Features(i,k) - Features(j,k))^2;
            end
            DistanceMatrix(i,j) = sqrt(summation);
        end    
    end
end
       