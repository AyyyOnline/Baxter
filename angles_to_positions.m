function poses = angles_to_positions(data, arm)

% EDITED: renamed from "compound" 
%
% NOTE: ATTEMPT TO PLOT ALL THE TRANSFORMATIONS WITH REGARDS TO TIME FROM
% THE TRAJECTORY FILE TO GET THE MOVEMENTS SPEED RIGHT
%
% Description:
%   Given the trajectories file, returns joints' positions at each point in
%   time
%
% Inputs:
%   data: matrix derived from a loaded trajectory file (that misses the
%   top row with column names)
%   arm: defines the arm that will be visualized. Can have two values: 
%   "right" or "left"
%
% Output:
%   poses: a matrix of positions for each joint in each point in time,
%   where 1st column is X, 2nd - Y, 3rd - Z coordinates. The dimensions
%   of the matrix are time_snaphots*7 x 3

% "strcmp" compares two strings
% (:, a:b) means extracting all rows, and columns from a to b
if strcmp(arm, "left")
    angles = data(:, 2:8);
elseif strcmp(arm, "right")
    angles = data(:, 10:16);
end

% Frames is a number of "snapshots" of positions that Baxter took when was
% recording angles. Simply speaking - number of rows in the trajectory file
frames = size(angles, 1);

poses = [];
% Obtain joint positions for each trajectory "snaphot" (row of the
% trajectory file)
for f = 1:frames
    trans = get_transform_matrices(angles(f,:));
    pos = get_joint_positions(trans);
    poses = [poses; pos];
end
