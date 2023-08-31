
function [SymbolicRepresentation]= funCreateSymbolicRepresentationPerCluster(Features)
% Given a set of features create symbolic representaiton 
% Input: Features
% Output: SymbolicRepresentation
% Author: Manjunath S and Prakash H N
%         Junior Research Fellow
%         Department of Studies in Computer Science
%         Manasagangotri, University of Mysore, Mysore.
% Date: 26 April 2007

AverageValue = mean(Features);
StandardDeviationValue = std(Features);
[NumberOfFeatures] = size(Features,2);
SymbolicRepresentation = zeros(1,NumberOfFeatures*2);
index = 1;
NumberOfFeaturesProcessed = 1;
while (NumberOfFeaturesProcessed <=  NumberOfFeatures)    
    SymbolicRepresentation(1,index) = (AverageValue(1,NumberOfFeaturesProcessed)- 1*(StandardDeviationValue(1,NumberOfFeaturesProcessed)));
    SymbolicRepresentation(1,index+1) =(AverageValue(1,NumberOfFeaturesProcessed)+ 1*(StandardDeviationValue(1,NumberOfFeaturesProcessed)));
    index = index + 2;
    NumberOfFeaturesProcessed = NumberOfFeaturesProcessed + 1;
end



