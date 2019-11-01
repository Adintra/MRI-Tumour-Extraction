clc; clear;
[filename pathname] = uigetfile({'*.jpg', '*.png'}, 'FileSelector');
fullpathname = strcat(pathname, filename);
MRI_image = imread(fullpathname);
Tumour_image = TumourBlobExtraction(MRI_image);