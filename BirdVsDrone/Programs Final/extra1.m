% clc;
% clear;
function [FF1]=extra1()


DatabasePath = 'C:\Users\DELL\Downloads\BirdVsDrone (1)\BirdVsDrone\';
NumberOFClasses = size(dir(DatabasePath),1);


k = 1;
for index1 = 1: NumberOFClasses - 2
    FolderName = sprintf('%s%d\\',DatabasePath, index1);
    TIFfile = dir(fullfile(FolderName, '\*.jpeg'));
    index21=randperm(length(TIFfile));
    for index2 = 1 : length(TIFfile)
        randomimage=index21(index2);
        fileName = fullfile(FolderName, TIFfile(randomimage).name); 
        Flowerimage = imread( fileName );
        Flowerimage=imresize(Flowerimage,[256 256]);
        
        
% % % % % % % % % % % %         Gabor Features Extraction 

        NumberOfBlocksForImagePartition=1;
        FeatureMatrix(1,:) = funExtractGabourFeatures(Flowerimage, NumberOfBlocksForImagePartition);
        ss=FeatureMatrix(1,:);
        ss1=ss';
        FF1(k,:) = cat(1,ss1);

        
        fprintf(1,'\nClass %d Image %d Completed',index1, randomimage);
        k = k + 1;
    end
    
    fprintf(1,'\nClass %d Completed',index1);
end

% 
% NumberOfClasses=2;
% nosamples=[389 389];
% k1 = 1;
% for index1 = 1 : NumberOfClasses
%     for index2 = 1 :nosamples(1,index1)
%         ClassIndex(1,k1) = index1;
%         k1 = k1 + 1;
%     end
% end
% 
% TempClassLabels=ind2vec(ClassIndex);
% net = newpnn(FF1',TempClassLabels,0.868);
% TempClassLabel = sim(net, FF1(400,:)'); % Testing
% ClassLabel = vec2ind(TempClassLabel);
% 
