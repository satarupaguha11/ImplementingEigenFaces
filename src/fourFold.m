%This function finds the Training and Testing Images.
%It takes as input the ImageData and the Label Data and depending upon our
%choice returns the corresponding Training Image Matrix, Testing Image
%Matrix, Test Label and Train Label. The function takes as input our
%choice, the number of classes(subjects), n denoting n fold cross 
%validation along with the Image Matrix and the Label Matrix

function [ TrainImage, TestImage , TrainLabel, TestLabel ] = fourFold( choice, numberOfSubjects, ImageMatrix, LabelMatrix )

n=4;
sizeOfImage = size( ImageMatrix, 1 );                                            %initialisation
numberOfImages = size( ImageMatrix, 2 );
imageInEachSubject = numberOfImages / numberOfSubjects;
step = imageInEachSubject / n;
step=floor(step);

ImageMatrix_1 = zeros( sizeOfImage, 1 );
ImageMatrix_2 = zeros( sizeOfImage, 1 );
ImageMatrix_3 = zeros( sizeOfImage, 1 );
ImageMatrix_4 = zeros( sizeOfImage, 1 );

LabelMatrix_1 = zeros( 1, 1 );
LabelMatrix_2 = zeros( 1, 1 );
LabelMatrix_3 = zeros( 1, 1 );
LabelMatrix_4 = zeros( 1, 1 );


for i = 1 : imageInEachSubject : numberOfImages                                   %create train and test data into 4 parts, 75% for training data, 25% for
    ImageMatrix_1 = [ ImageMatrix_1 ImageMatrix( :, i : i+step-1 ) ];                %testing data
    ImageMatrix_2 = [ ImageMatrix_2 ImageMatrix( :, i+step: i+2*step-1 ) ];
    ImageMatrix_3 = [ ImageMatrix_3 ImageMatrix( :, i+2*step : i+3*step-1 ) ];
    ImageMatrix_4 = [ ImageMatrix_4 ImageMatrix(:, i+3*step : i+4*step-1 ) ];
    
    LabelMatrix_1 = [ LabelMatrix_1 ; LabelMatrix( i : i+step-1, 1 ) ];
    LabelMatrix_2 = [ LabelMatrix_2 ; LabelMatrix( i+step : i+2*step-1, 1 ) ];
    LabelMatrix_3 = [ LabelMatrix_3 ; LabelMatrix( i+2*step : i+3*step-1, 1 ) ];
    LabelMatrix_4 = [ LabelMatrix_4 ; LabelMatrix( i+3*step : i+4*step-1, 1 ) ];
       
end

ImageMatrix_1 = ImageMatrix_1 (:,2:end);
ImageMatrix_2=ImageMatrix_2(:,2:end);
ImageMatrix_3=ImageMatrix_3(:,2:end);
ImageMatrix_4=ImageMatrix_4(:,2:end);


LabelMatrix_1= LabelMatrix_1(2:end,:);
LabelMatrix_2= LabelMatrix_2(2:end,:);
LabelMatrix_3= LabelMatrix_3(2:end,:);
LabelMatrix_4= LabelMatrix_4(2:end,:);


if (choice==1)                                                              %combine sets depending upon our choice
    TrainImage=[ImageMatrix_1 ImageMatrix_2 ImageMatrix_3];
    TestImage=ImageMatrix_4;
    
    TrainLabel=[LabelMatrix_1; LabelMatrix_2; LabelMatrix_3];
    TestLabel=LabelMatrix_4;
elseif (choice==2)
    TrainImage=[ImageMatrix_2 ImageMatrix_3 ImageMatrix_4];
    TestImage=ImageMatrix_1;
    
    TrainLabel=[LabelMatrix_2; LabelMatrix_3; LabelMatrix_4];
    TestLabel=LabelMatrix_1;
    
elseif(choice==3)
    TrainImage=[ImageMatrix_3 ImageMatrix_4 ImageMatrix_1];
    TestImage=ImageMatrix_2;
    
    TrainLabel=[LabelMatrix_3; LabelMatrix_4; LabelMatrix_1];
    TestLabel=LabelMatrix_2;
elseif (choice==4)
    TrainImage=[ImageMatrix_4 ImageMatrix_1 ImageMatrix_2];
    TestImage=ImageMatrix_3;
    
    TrainLabel=[LabelMatrix_4; LabelMatrix_1; LabelMatrix_2];
    TestLabel=LabelMatrix_3;
else
    disp('Incorrect Choice')
end

end
