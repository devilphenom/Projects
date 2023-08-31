
function [DCTCoefficients] = funColorLayout(Image, NumberOfBlockPartition, NumberOfCoefficients)
% Function Description: The Color Layout compactly characterizes the 
%          spatial distributions of color within an image. The Color layout 
%          is expressed on the YCbCr color space. 
% Input: Image in YcbCr Clor space - To convert RGB to YCbCr we can use
%        rgb2ycbcr function. 
%        NumberOfBlockPartition = 64 (8*8)
%        NumberOfCoefficients = 6 for luminance and 3 for both chrominance
%        components. 
% Output: DCTCoefficients : We will be having 6+3+3 features per block.
%         Totally we will be having (6+3+3)*64 features per image. 
% Date: 31 March 2010
% Author: Manjunath S, Research Scholar 
%         Department of Studies in Computer Science
%         University of Mysore, Mysore, Karnataka, India. 
% 

A = imresize(Image,[256 256]);

sizeOfImage = size(A); 
nob = NumberOfBlockPartition; %nob- Number of blocks
fact=ceil(sqrt(nob)); % 4:2, 16:4, 64;8; % blsz: Block size

blsz = floor(sizeOfImage(1,1)/fact); 
nobx = sizeOfImage(1,2)/blsz;
noby = sizeOfImage(1,1)/blsz;

ps = sqrt(nob);
blno = 1; % block number

noch = 1; % 1for gray, 3 for coloure image; noch : number of channel (R,G,B or Gray)
% Dividing the entire image into blocks

for i = 1 : nobx
    for j = 1 : noby
      bl(:,:,blno) = A(((i*blsz - blsz + 1):i*blsz),((j*blsz - blsz + 1):j*blsz));
      blno = blno +1;
    end
end



blno=1;
DCTCoefficients = [];
for index2 = 1 : nobx
    for index3 = 1 : noby        
        DCTCoefficientsTemp = dct(double(bl(:,:,blno)));
        zmat = zigzag(DCTCoefficientsTemp,NumberOfCoefficients);        
        DCTCoefficients = cat(1,DCTCoefficients, zmat);
        clear DCTCoefficientsTemp;
        blno = blno + 1; 
    end
end