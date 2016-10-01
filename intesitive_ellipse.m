% Estimate the intensity of the area delimited by the ellipses in a image.
% INPUT:
%     I: Image in gray scale.
%     ellipse: a set of ellipses (matrix of Nx5). 
% OUTPUT:
%      integral: Vector with the sum of all pixel intensity. Each element of the vector 
%                represent an ellipse.
%     integralN: Vector with the sum of all pixel intensity divided by the number 
%                of pixels inside the ellipse.
%       N_pixel: Vector with the numbers of pixels inside each ellipse.
%-----------------
% Author: Yasel Garcés Suárez (88yasel@gmail.com)
%---------------------------------------------------------------------------------------------

function [integral,integralN,N_pixel]=intesitive_ellipse(I,ellipse)

% Take the ubication of every pixel in the image
pixel=[];
colum=size(I,2);
for i=1:size(I,1)
    pixel=[pixel; [repmat(i,colum,1) (1:colum)']];
end

% Evaluate all pixels in each ellipse
for i=1:size(ellipse,1)
    % Extract the parameters of the ellipse
    a =ellipse(i,1);  b=ellipse(i,2);
    cx=ellipse(i,3); cy=ellipse(i,4);
    % Evaluate the coordinates of all pixels in the conic.
    t=(((pixel(:,1)-cx).^2)./(a^2)) + (((pixel(:,2)-cy).^2)./(b^2));
    
    % Find the points that are inside of the ellipse
    indica=t<1;
    impor_pixel=pixel(indica,:); 
    
    % Take the pixels inside the conic in the image and compute the integral of 
    % the intensity of those pixels.
    % Number of the pixels
    N_pixel(i)=sum(indica);
    % Intensity of the pixels inside the conic. This function return the information in 
    % RGB format, the image are in gray scale, so, all three columns are the same.
    test=impixel(I,impor_pixel(:,1),impor_pixel(:,2));
    intensity=test(:,1);
    % Sum of all pixel intensity (integral intensity).
    integral(i)=sum(intensity);
    % Sum of the intensity divided by the number of pixels inside the ellipse.
    integralN(i)=integral(i)/N_pixel(i);
end
