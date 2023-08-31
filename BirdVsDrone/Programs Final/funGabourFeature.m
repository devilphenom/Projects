

function [Features] = funGabourFeature(Image,NumberOfBlocksForImagePartition)

resizedImage = imresize(Image,[256 256]);
A=resizedImage;
sizeOfImage = size(A); 
nob = NumberOfBlocksForImagePartition; %nob- Number of blocks
fact=sqrt(nob); % 4:2, 16:4, 64;8; % blsz: Block size
    
blsz = sizeOfImage(1,1)/fact; 
nobx = sizeOfImage(1,2)/blsz;
noby = sizeOfImage(1,1)/blsz;

ps = sqrt(nob);
blno = 1; % block number

noch = 1; % 1for gray, 3 for coloure image; noch : number of channel (R,G,B or Gray)
% Deviding the entire image into blocks
for i = 1 : nobx
    for j = 1 : noby
      bl(:,:,blno) = A(((i*blsz - blsz + 1):i*blsz),((j*blsz - blsz + 1):j*blsz));
      blno = blno +1;
    end
end

G_count=0;
gabcnt = 1;
for kk = 1 : nob % #of blocks
    F=double(bl(:,:,kk));
    count=0;
    for i = 22.5 : 22.5 : 160            % angle range
        for j= 0 : 2 : 10     % Scale range
            count=count+1;
            [G,gabout] = gaborfilter1(F,2,4,2^j,(i*3.14)/180);
            blimg(:,:,gabcnt) = uint8(mod(gabout,255));      
            gabcnt = gabcnt + 1;
        end
    end
G_count=G_count + count;
end % end for kk

Features = funExtractFeatures(blimg);

