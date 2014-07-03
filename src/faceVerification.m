%This function reports average accuracy for four fold cross validation for
%image verification. It takes as input the number of eigen vectors the
%number of classes, the image matrix, the label matrix and the image in
%each class

function [averageAccuracy] = faceVerification(kEigen, numberOfSubjects,ImageMatrix,LabelMatrix,ImageInEachClass)
 
 accuracy=zeros(4,1);                                                                                       %initialisation
 correct=zeros(4,1);
 [thresholdValue]=rocCurve(ImageMatrix, LabelMatrix, ImageInEachClass)
 
 for i=1:4
    [TrainImage, TestImage , TrainLabel, TestLabel] = fourFold(i,numberOfSubjects,ImageMatrix,LabelMatrix); %four fold validation
    numberOfTestImages=size(TestImage,2);   
    
    for index=1:numberOfTestImages
        
        flag=1;                                                                                             %create random class label for claim
        while(flag)
            claimedLabel=randi([1 numberOfSubjects]);
            if (claimedLabel~=14)
                flag=0;
            end
        end
        [label]= computeLabel(TrainImage, TestImage(:,index), TrainLabel, claimedLabel,kEigen,thresholdValue);  %compute the label as yes or no.
        if ((claimedLabel==TestLabel(index,:)) && (label==0))                                                   %calculate accuracy
            correct(i)=correct(i)+1;
        elseif((claimedLabel~=TestLabel(index,:)) && (label==1))
            correct(i)=correct(i)+1;
        end
    end
    accuracy(i)=correct(i)/numberOfTestImages
 end
 averageAccuracy=mean(accuracy)*100;
end
        
    