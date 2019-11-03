clc; clear;
[filename pathname] = uigetfile({'*.jpg', '*.png'}, 'FileSelector');
if filename == 0
    return
end
fullpathname = strcat(pathname, filename);
MRI_image = imread(fullpathname);
Tumour_image = TumourBlobExtraction(MRI_image);
imshow(Tumour_image);