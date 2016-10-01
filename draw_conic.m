% This function generate the points (and foci) of any conic (ellipse, parabola or hyperbola)
% INPUT:
% conica : Implicit form of the conic.
%   ellipse or hyperbola : [a b cx cy theta] 
%   parabola : [p cx cy theta]
% w : Control parameter of the conic. 
%     w < 1 : Elipse
%     w = 1 : Parabola
%     w > 1 : Hiperbola
% OUTPUT:
%     X,Y : Points of the conic.
%    Foci : Foci of the conic.

function [ X, Y, Foci ] = draw_conic( conica, w )

% Verify the parameters of the parabola
if w == 1 && size(conica, 2) ~= 4,
    error('The parabola input values are bad');
end
if w ~= 1 && size(conica, 2) ~= 5, 
    error('The input values are bad');
end

if w == 1,
    p = conica(1);
    if p ~= 0, 
        error('The parameter "p" of the parabola must be different to zero');
    end
end

% Verify the parameters of the ellipse and hyperbola
if w ~= 1,
    a = conica(1);
    b = conica(2);
    if a < 0 || b < 0,
        error('The parameters "a, b" of the ellipse or hyperbola must be higher of zero');
    end
end

% Extract the rotation angle of the conic
theta = conica(end);
% Extract the center of the conic
cx = conica(end-2);
cy = conica(end-1);

% Compute the sin and cos of the rotation angle.
se = sin(theta);
co = cos(theta);

% Transformation matrix
T = [co se; -se co];


if w < 1 % Ellipse case
    inc_x = -a: 0.1 :a;
    inc_y = sqrt( (b^2) * ( 1- ( inc_x./a ).^2) );
    
    inc_x = [inc_x inc_x(end:-1:1)];
    inc_y = [inc_y -inc_y(end:-1:1)];
    
elseif w > 1 % Hyperbola case
    inc_y = -(a+10): 0.1 :a+10;
    inc_x = sqrt( (a^2) * ( 1+ ( inc_y./b ).^2) );
    
elseif w == 1 % Parabola case
    inc_y = -(2*p+1): 0.1 :(2*p+1);
    inc_x = ( inc_y.^2 )./( 4*p );
    % Compute the foci of the parabola
    Foci = ([a 0]*T) + [cx cy];
end

% Rotation of the conic
x1 = inc_x.*co - inc_y.*se;
y1 = inc_x.*se + inc_y.*co;

% Translation of the conic
X = x1 + cx;
Y = y1 + cy;

if w == 1, 
    return; 
end
% Compute the foci for the ellipse or hyperbola.
if w < 1
    c = sqrt(a^2 - b^2);
elseif w > 1
    c = sqrt(a^2 + b^2);
end
Foci = [c 0; -c 0];
Foci = [Foci(1,:)*T + [cx cy]; Foci(2,:)*T + [cx cy]];