function transforms = dh_transform_matrix(angles, marker_length)

% EDITED: combined with "get_parameters" function
%
% Description
%

ang = angles;
m = marker_length;
% Get the dh parameters for each joint.
     %d          r       theta       alpha
dh = [0.27035    0.069   ang(1)      -pi/2;...
      0          0       ang(2)+pi/2  pi/2;...
      0.36435    0.069   ang(3)      -pi/2;...
      0          0       ang(4)       pi/2;...
      0.37429    0.1     ang(5)      -pi/2;...
      0          0       ang(6)       pi/2;...
      m          0       ang(7)       0];

% There are 7 joints in each arm.
joints = 7;
% "transforms" will comprise transformation matrices for each joint
% stacked vertically
transforms = [];

for j=1:joints
    d = p(j,1);
    r = p(j,2);
    o = p(j,3);
    a = p(j,4);
    
    % Tranformation matrix from a text book.
    t = [cos(o), -sin(o)*cos(a),  sin(o)*sin(a), r*cos(o);...
         sin(o),  cos(o)*cos(a), -cos(o)*sin(a), r*sin(o);...
         0,       sin(a),         cos(a),        d;       ...
         0,       0,              0,             1           ];
    
    % Concatenate one transformation matrix below the previous one
    transforms = [transforms; t];
end