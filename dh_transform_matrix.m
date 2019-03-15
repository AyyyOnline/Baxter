function y = dh_transform_matrix(parameters)

% Suppose that:
% p(x,1) is d
% p(x,2) is r
% p(x,3) is o (theta)
% p(x,4) is a (alpha)
p = parameters;

% The first row is usually zeros.

% Get dimensions of the parameters matrix
dim = size(p);
% Number of rows defy number of joints (without base)
joints = dim(1,1);

transforms = [];

for j=1:joints
    d = p(j,1);
    r = p(j,2);
    o = p(j,3);
    a = p(j,4);
    t = [cos(o), -sin(o)*cos(a), sin(o)*sin(a), r*cos(o);...
        sin(o), cos(o)*cos(a), -cos(o)*sin(a), r*sin(o);...
        0, sin(a), cos(a), d;...
        0, 0, 0, 1];
    transforms = vertcat(transforms, t);
end

y = transforms;