% This function erase the arcs that contain less number of points than a value fixed.
% INPUT:
%       Bo: cell array that contains all the arcs.
%       num_point: minimal number of points (scalar value) 
% OUTPUT:--------
%        Bo: New cell array with the arcs that have more elements than
%        num_points.
%-----------------
% Author: Yasel Garcés Suárez (88yasel@gmail.com)
%---------------------------------------------------------------------------------------------

function [Bo1,index_arc]=eliminate_arcs(Bo, num_point)

% Declarate the variables (empty)
Bo1=[];
index_arc=[];

% Filter all the arcs and if a arcs have more points than "num_point" save
% the arcs.
for t=1:length(Bo)
    if length(Bo{t})>=num_point
        Bo1{end+1}=Bo{t};
        index_arc(end+1)=length(Bo{t});
    end
end