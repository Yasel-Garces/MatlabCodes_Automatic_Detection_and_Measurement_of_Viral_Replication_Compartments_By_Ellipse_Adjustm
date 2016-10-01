% Principal scrip to read and process all images in one specifict hours
% post infection
% INPUT: Only it's necessary to specify the path for read all images.
% RESULTS: The results will be saved in a .csv file with a specific 
%          structure.
%   Column 1: Number of the image
%   Column 2: Major semiaxis (A)
%   Column 3: Minor semiaxis (B)
%   Column 4 and 5: Center of the ellipse (cx,xy)
%   Column 6: Rotation angle of the ellipse.
%   Column 7: Area of the ellipse.
%   Column 8: Perimeter of the ellipse.
%   Column 9: Eccentricity  of the ellipse.
%   Column 10: Mean of the pixel intensitive inside the ellipse (normalize 
%              integral)
%   Column 11: Sum of the pixels intensitive inside the ellipse (integral)
%   Column 12: Umbral intensity for the ellipses detection.
%   Column 13: Number of the ellipses detected.
%-----------------
% Author: Yasel Garcés Suárez (88yasel@gmail.com)
%---------------------------------------------------------------------------------------------

% CONTROL VARIABLES
% Path for the images
path = 'ForTest/';
% Type of the images
type='*.tif';
% Channel selection (red, green, blue)
channel='blue';

%---------------------------------------------------
% Read all the files in the directory
% Structu array with all the information about the files in "path".
files=dir(fullfile(path,type));
% Get only the names of the files.
files={files.name};
%---------------------------------------------------

% Declaration of the variables
Data=cell(length(files),1);
format shortg

% Load one by one image and do the processing
for i=1:length(files)
    % Read the image
    nameImg=files(i);
    image=imread(char(strcat(path,nameImg)));
    
    % Channel selection
    if strcmp(channel,'blue')
        NewImage=image(:,:,3);
    elseif strcmp(channel,'green')
        NewImage=image(:,:,2);
    else
        NewImage=image(:,:,1);
    end
    
    % Compute the threshold
    media=min(mean(NewImage));
    desviacion=max(std(double(NewImage)));
    MI=round(media+(2*desviacion));
    
    % Detection and adjusment of ellipses
    ellipse=New_DLSFE(NewImage,MI);
    % If the algorithm dont find any ellipse continue with other image
    if isempty(ellipse)
        continue
    end
    % Compute the area, perimeter and eccentricity
    [Area,Perimeter,Eccentricity]=elipse_data(ellipse);
    [integral integralN N_pixel]=intesitive_ellipse(NewImage,ellipse);
    
    % Take the number of the image
    % nameImg=char(nameImg);
    number=i;
    number=repmat(number,length(Area),1);
    
    % Save the results in a cell array
    Data{i}=[number, ellipse, Area, Perimeter, Eccentricity, ...
        integralN', integral', repmat(MI,1,length(Area))', ...
        repmat(length(Area),1,length(Area))'];
    
    % Plot the results
    figure
    imshow(image)
    hold on
    for j=1:size(ellipse,1)
        [X, Y, Foci] = draw_conic(ellipse(j,:), 0);
        plot(Y,X,'w','linewidth',2)
    end
    % ----------------
end
% Store all data in only one dataset.
Data=cell2mat(Data);
% Save in a .csv
csvwrite('Test',Data);