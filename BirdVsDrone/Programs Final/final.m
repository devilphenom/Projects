clc;
clear;



DatabasePath = 'C:\Users\mitis\Desktop\leaf project\non medical leaves\';
NumberOFClasses = size(dir(DatabasePath),1);


k = 1;
for index1 = 1: NumberOFClasses - 2
    FolderName = sprintf('%s%d\\',DatabasePath, index1);
    TIFfile = dir(fullfile(FolderName, '\*.jpg'));
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
        Flowergabour1Matrix(k,:) = cat(1,ss1);

        
        fprintf(1,'\nClass %d Leaf %d Completed',index1, randomimage);
        k = k + 1;
    end
    
    fprintf(1,'\nClass %d Completed',index1);
end





                    class=1;
                    k = 1;
                    for index1 = 1: NumberOFClasses - 2
                        FolderName = sprintf('%s%d\\',DatabasePath, index1);
                        TIFfile = dir(fullfile(FolderName, '\*.jpg'));
                        imagesinclass(:,k)=length(TIFfile);
                        fprintf(1,'\nClass %d Completed',index1);
                        classleaf(:,class)=class;
                        class=class+1;
                        k=k+1;
                    end


            Gaborfeatures=Flowergabour1Matrix;
b=isnan(Gaborfeatures);
Gaborfeatures(b)=0; 




NumberOfClasses=5;

samples=80;
for index12 = 1 : NumberOfClasses
     Numberoftraining=imagesinclass(1,index12);
     NumberOfTrainingsamples(1,index12)=round(Numberoftraining*samples/100);     
end

for index12 = 1 : NumberOfClasses
     Numberoftraining=imagesinclass(1,index12);
     Numberoftraining1=NumberOfTrainingsamples(1,index12);
     NumberOfTestingsamples(1,index12)=Numberoftraining-Numberoftraining1;     
end




TrainIndex = 1;
TestIndex = 1;
TempIndex = 1;
for index1 = 1:NumberOfClasses
    for index2 = 1 : imagesinclass(1,index1)
        if(index2 <= NumberOfTrainingsamples(1,index1))
            TrainingFeatures(:,TrainIndex) = Gaborfeatures(TempIndex,:);
            TrainIndex = TrainIndex + 1;
            
        else
            TestingFeatures(:,TestIndex) = Gaborfeatures(TempIndex,:);
            TestIndex = TestIndex + 1;
        end
        TempIndex = TempIndex + 1;        
    end
end



  TrainingFeatures1=TrainingFeatures;



% % % % % % % % % % % % % % %  NN Classifier 

k1 = 1;
for index1 = 1 : NumberOfClasses
    for index2 = 1 :NumberOfTrainingsamples(1,index1)
        ClassIndex(1,k1) = index1;
        k1 = k1 + 1;
    end
end
k1 = 1;
for index1 = 1 : NumberOfClasses
    for index2 = 1 : NumberOfTestingsamples(1,index1)
        ClassIndx(1,k1) = index1;
        k1 = k1 + 1;
    end
end






% % % % % % % % % % % % % % % % % % % % % % % % % % NN classifer


TempClassLabels=ind2vec(ClassIndex);
net = newpnn(TrainingFeatures,TempClassLabels,0.868);


CorrectlyClassified = zeros(1, NumberOfClasses);
WronglyClassified = zeros(1, NumberOfClasses);
count1 = 1;
for index1 = 1 : NumberOfClasses
    for index2 = 1 : NumberOfTestingsamples(1,index1)     
        TempClassLabel = sim(net, TestingFeatures(:,count1)); % Testing
        ClassLabel = vec2ind(TempClassLabel);
%          TempClassLabel=abs(round(TempClassLabel));
        ClassLabelNN(:,count1)=ClassLabel;
        if ( ClassLabel ==index1)
            CorrectlyClassified(1,index1)=CorrectlyClassified(1,index1)+1;
        else
            WronglyClassified(1,index1)=WronglyClassified(1,index1)+1;
        end
       count1 = count1 + 1;
    end
%     fprintf(1,'\nClass %d Completed\n',index1);
    % disp(count1);
end

   ClassificationRate= (sum(CorrectlyClassified)/sum(NumberOfTestingsamples))*100
  





