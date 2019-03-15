% Base position must be a 4x4 matrix (like translation one)
function y = transform_joints(trans_matrices, base_pos)

% Get number of joints.
dim = size(trans_matrices);
joints = dim(1,1);

% Matrix for positions. First point is base.
pos = base_pos(1:3,4);

% base_pos must have a format of translation matrix (square).
% Change the way you multiply positions with transformations.
prev = base_pos;

for j=1:4:joints
    t = trans_matrices(j:j+3,1:4);
    new = prev * t;
    prev = new;
    
    % Change format of the position matrix
    new = new * [0;0;0;1];
    pos = horzcat(pos, new(1:3,:));
end

y = pos;