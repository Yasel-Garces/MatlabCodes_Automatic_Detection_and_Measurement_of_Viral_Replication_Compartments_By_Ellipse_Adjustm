% Detect the ellipses that ajust the RC.
% INPUT:
%      NewImage: Gray image with the channel that marks the RC.
%      minimal_intensitive: Threshold computed fot this image.
% OUTPUT:
%      ellipse: Array of n rows in which each row contain the coefficients
%      of one ellipse in the form (A,B,CX,CY,Theta).
%-----------------
% Author: Yasel Garcés Suárez (88yasel@gmail.com)
%---------------------------------------------------------------------------------------------

function ellipse=New_DLSFE(NewImage,minimal_intensitive)

% Thresholding the image "NewImage"
In=NewImage>=minimal_intensitive;
% Convert the image to 8 bits. This step no is necessary, just we do for convenience to work 
% with gray values in [0,255].
BW=NewImage.*uint8(In);
%.----------------------------

% Compute the connected components:
[Bo, ~]= bwboundaries(BW,8,'noholes');

% Delete the arcs with a number of points less than 5. This step not is necessary but 
% if the arcs not have much information the algorithm DLSFE can generate numeric errors.
[Bo,~]=eliminate_arcs(Bo,5);

ellipse=[];
% For each arc adjust a ellipse with the algorithm DLSFE.
for i=1:length(Bo)
    CA=Bo{i};
    v = fit_ellipse_LSFE(CA(:,1), CA(:,2));
    if isempty(v)
        continue
    else
        ellipse(end+1,:)=v;
    end
end