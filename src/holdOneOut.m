%This function implements the holdone out method to create training and
%testing data. It takes as input the Image Matrix, the Label Matrix, the
%number of images in each class and the class numberand returns the 
%training data, training label, testing data and testing label.

function [ TrainImage, TestImage , TrainLabel, TestLabel ] = holdOneOut( ImageMatrix, LabelMatrix,i)

sizeOfImage = size( ImageMatrix, 1 );
TrainImage = zeros( sizeOfImage, 1 );
TrainLabel = zeros(1,1);
numberOfImages=size(ImageMatrix,2);

TestImage = ImageMatrix(:,i);
TestLabel = LabelMatrix(i,1);

if (i==1)                                                                   %for the first image
    TrainImage = [TrainImage ImageMatrix(:,2:end)];
    TrainLabel = [TrainLabel ;LabelMatrix(2:end,1)];
elseif(i==numberOfImages)                                                   %for the last image
    TrainImage = [TrainImage ImageMatrix(:,1:i-1)];
    TrainLabel = [TrainLabel ;LabelMatrix(1:i-1,1)];
else                                                                       %for other images
    TrainImage = [TrainImage ImageMatrix(:,1:i-1)];
    TrainImage = [TrainImage ImageMatrix(:,i+1:end)];
    TrainLabel = [TrainLabel ;LabelMatrix(1:i-1,1)];
    TrainLabel = [TrainLabel ;LabelMatrix(i+1:end,1)];
end
TrainImage = TrainImage(:,2:end);
TrainLabel = TrainLabel(2:end,:);
    
end