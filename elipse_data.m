% Compute the area, perimeter and eccentricity of n ellipses.
% INPUT:
%      ellipse: array Nx5 (set of n ellipses in the form [a b cx cy theta])
% OUTPUT:
%      Area, Perimeter and Eccentricity of the ellipses.
%-----------------
% Author: Yasel Garcés Suárez (88yasel@gmail.com)
%---------------------------------------------------------------------------------------------
function [Area,Perimeter,Eccentricity]=elipse_data(ellipse)

% Compute the area
Area=pi.*ellipse(:,1).*ellipse(:,2);
% Compute the perimeter
Perimeter=pi.*((3.*(ellipse(:,1)+ellipse(:,2))) - ...
    (sqrt((3.*ellipse(:,1)+ellipse(:,2)).*(ellipse(:,1)...
    +3.*ellipse(:,2)))));
% Compute the eccentricity
Eccentricity=sqrt(1-((ellipse(:,2).^2)./(ellipse(:,1).^2)));
