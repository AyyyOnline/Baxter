function intersectMatrix = get_intersections(W2, tip, table)

% Description:
%   Makes use of the plane_line_intersect funciton that was written by
%   another author. This function assumes that the surface is parallel to
%   the ground and does not have edges.
%   This function has a challenge: how to define a segment of a marker
%   that, when intersecting with table, creates a drawing? It cannot be of
%   a size of a point. And it cannot be the whole marker length (from tip
%   to W2). Such a segment must be calculated.
%
% Inputs:
%   W2: 3x1 Matrix of [x;y;z] positions of the W2 joint.
%   tip: 3x1 Matrix of [x;y;z] position of the tip.
%   table: Height (z-coordinate) of the table
%   (all positions are realtive to the joint S0)
%
% Output:
%   intersectMatrix: a 4-column matrix that stores the check value for
%   intersection between the arm and the table, and the coordinates of the
%   intersection point at each point in time. 1-3 columns store
%   coordinates, and the 4th column - the intersection check (value 1 means
%   intersection exists).

% Since we assume that the table is parallel to the ground, the normal
% vector to the table plane is [0 0 table]
