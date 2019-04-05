function poses = get_joint_positions(trans_matrices)

% EDITED: renamed "transform_joints"
%
% Description
%   Using transformation matrices, obtains positions for each joint,
%   assuming that S0 (first joint) is located at (0,0,0).
%
% Inputs:
%   trans_matrices: transformation_matrices for each joint
%
% Output:
%   pos: matrix of x,y,z positions for each joint, where rows are for
%   X-coord, Y-coord and Z-coord, and columns are for joints. That is, the
%   pos matrix has 3x7 dimensions.

% Safe the number of rows of the "trans_matrices" matrix.
% Number of joint is always 7 for Baxter.
transform_rows = 7 * 4;
compounf
% Matrix for positions. First point is S0 that is assumed to be at the
% origin.
poses = [0;0;0];

% zero-matrix initially. When such matrix is multiplied on some matrix M,
% the result will be matrix M.
transformed = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Since "transformation_matrices" contains 4x4 matrix for each joint we
% need to iterate with a step of 4 to get position for each joint. Notation
% "j = 1:4:28" means j will be equal to 1, 5, 9, 13,.. 25 during the loop.
for j=1:4:transform_rows
    % Get a transform matrix for joint j.
    t = trans_matrices(j:j+3, 1:4);
    
    % Transform the matrix of positions
    transformed = transformed * t;
    
    % Extract x,y,z positions from the transformed matrix.
    pos = transformed * [0;0;0;1];
    
    % Leave out the fourth row from "pos" since it's redundant
    % Append a new column with x,y,z coordinates for another joint
    poses = [poses, pos(1:3)];
end