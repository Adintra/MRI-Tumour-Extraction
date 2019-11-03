function imageOutput = TumourBlobExtraction(imageInput)
%TUMOURBLOBEXTRACTION Summary of this function goes here
%   Detailed explanation goes here

% Greyscale of image
greyImage = rgb2gray(imageInput);
% Apply high pass filter
highPassKernal = [-1 -1 -1;-1 8.6 -1;-1 -1 -1];
highPassImage = imfilter(greyImage, highPassKernal);;
% Apply median filter
medianImage = medfilt2(highPassImage);
% Threshold segmentation
thresholdValue = 100;
thresholdImage = medianImage > thresholdValue;
thresholdImage = imfill(thresholdImage, 'holes');
imshow(thresholdImage)
% Morphological operations
imageMorph = bwmorph(thresholdImage, 'skel');
imageMorph = bwmorph(imageMorph, 'branchpoints', 4);
imageMorph = bwmorph(imageMorph, 'spur', 4);
imageOutput = bwmorph(imageMorph, 'clean', inf);
end