% Base position must be a 4x4 matrix (like translation one)
function y = transform_joints(trans_matrices)

% Get number of joints.
dim = size(trans_matrices);
joints = dim(1,1);

% Matrix for positions. First point is S0 that is assumed to be at the
% origin.
pos = [0;0;0];

% 0 matrix initially. When such matrix is multiplied on some matrix M, the
% result will be matrix M.
prev = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

for j=1:4:joints
    t = trans_matrices(j:j+3,1:4);
    new = prev * t;
    prev = new;
    
    % Change format of the position matrix
    new = new * [0;0;0;1];
    pos = horzcat(pos, new(1:3,:));
end

y = pos;