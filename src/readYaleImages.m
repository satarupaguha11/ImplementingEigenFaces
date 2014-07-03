%This function reads the Yale Dataset and returns the Image Matrix and the
%corresponding Label Matrix.It takes as input the number of images in the 
%yale dataset and the image size in which we want to resize the images

function [ ImageMatrix, LabelMatrix ,ImageInEachClass] = readYaleImages( resize )

%m=760                                                                      %initialisation
%resize=100/80
numberOfImages=760;
N = resize*resize;
ImageMatrix = zeros(N,numberOfImages);
LabelMatrix = zeros(numberOfImages,1);
ImageInEachClass=20*ones(38,1);

path = 'H:\MS\SMAI\Assignment\Eigen Faces\newCroppedYale\';
k = 1;

for i = 1:39                                                                %loop for each subject
    
  if ( i == 14)
    continue
  end  
  
                                                                            
  pathName = strcat( path, num2str( i ) );                                  %get all the files for the subject
  directory = dir( pathName );
  dirIndex = [ directory.isdir ];
  fileList = { directory( ~dirIndex ).name };
  
 
  for j = 1:length( fileList )                                              %Read each image and insert into the Image Matrix along with the label
       fileName = fileList( j );                                            %given by the folder name
       fileName = fileName{:};
       imagePath = strcat( pathName,'\',fileName );
       data = imread( imagePath,'pgm' );
       data = imresize( data,[ resize resize ] );
       ImageMatrix( :,k ) = reshape( data,resize*resize,1 );
       LabelMatrix( k,1 ) = i;
       k = k+1;
  end
  disp(i)
end
end
