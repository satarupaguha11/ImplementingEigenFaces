function [ImageMatrix,LabelMatrix,ImageInEachClass]=addNoiseRotate(ImageMatrix,LabelMatrix,ImageInEachClass)
numberOfNewImages=50;
indices=zeros(numberOfNewImages,1);

for i=1:numberOfNewImages
    indices(i)=randi([1 numberOfNewImages]);
end
% class(ImageMatrix)
for i=1:numberOfNewImages
%     index=indices(i);
    index=1;
    image=ImageMatrix(:,20);
%     imshow(reshape(image,80,80),[0 255])
    label=LabelMatrix(index,:);
    [rotatedImage]= rotateImage(image,8);
%     imshow(rotatedImage,[0 255])
    rotatedImage=reshape(rotatedImage,6400,1);
    rotatedImage=uint8(rotatedImage);
    noisyImage=addNoise(rotatedImage);
%     imshow(reshape(noisyImage,80,80),[0 255]) 
    noisyImage=double(noisyImage);
    ImageMatrix=[ImageMatrix noisyImage];

%     image=uint8(image);
%     noisyImage=addNoise(image);
%     noisyImage=double(noisyImage);
%     imshow(reshape(noisyImage,80,80),[0 255])
%     ImageMatrix=[ImageMatrix noisyImage];
    
    
%     ImageMatrix=[ImageMatrix rotatedImage];
    LabelMatrix=[LabelMatrix ;label];
    for j =1:size(ImageInEachClass,1)
        if j==label
           ImageInEachClass(j)= ImageInEachClass(j)+1;
        end
    end
    break
end

end