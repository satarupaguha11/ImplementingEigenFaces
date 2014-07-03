%This function generates pairs of images. For each class it takes 5 images 
%from the same class and 5 from the other class. 
%It takes as input the Image Matrix, the Label Matrix and the number of
%images in each class and returns the pairs of images.

function [allPairs] = generatePairs(ImageMatrix, LabelMatrix, ImageInEachClass)

NumberOfImages=size(ImageMatrix,2);
allPairs=zeros(1,2);
i=1;

for i=1:ImageInEachClass(i):NumberOfImages
    
    label=LabelMatrix(i);                                                   %find indices of same classes
    indices1=find(LabelMatrix==label);
    indices1=indices1';
    
    sameClassIndices=perms(indices1(1:4));                                  %find pairs of the same class
    sameClassIndices=sameClassIndices(1,:);
    
    indices2=find(LabelMatrix~=label);                                      %find indices of other classes
    indices2=indices2';
    diffClassIndices=perms(indices2(1:5));                                  %find pairs for other classes
    diffClassIndices=diffClassIndices(3,:);
    
    pairs=zeros(9,2);                                                       %combine pairs and return
    pairs(1:9,1)=i;
    pairs(1:4,2)=sameClassIndices(1:4);
    pairs(5:9,2)=diffClassIndices(1:5);
    allPairs=[allPairs ;pairs];
    
end
allPairs=allPairs(2:end,:);
end