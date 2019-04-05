function dynamic_plotting(positions, intersectMatrix)

% Description:
%   Given the positions of joints in time, draws and animates Baxter's arm.
%   Also, given the intersection points and lines matrix, draws those
%   points to visualize what Baxter would draw.
%
% Inputs:
%   positions: a matrix of positions of each joint in time. 
%       j1  j2  ... j7
%   x1  ?   ?   ... ?    <- At time 1
%   y1  ?   ?   ... ?
%   z1  ?   ?   ... ?
%   x2  ?   ?   ... ?    <- At time 2
%   y2  ?   ?   ... ?
%   z2  ?   ?   ... ?
%          ...
%   xn  ?   ?   ... ?    <- At time n
%   yn  ?   ?   ... ?
%   zn  ?   ?   ... ?
%
%   intersectMatrix: a 4-column matrix that stores the check value for
%   intersection between the arm and the table, and the coordinates of the
%   intersection point at each point in time. 1-3 columnes store
%   coordinates, and the 4th column - intersection check (value 1 means
%   intersection exists).
%
% Output:
%   no value returned.
%   plots and animates the arm, table and the drawing produced.

% First row is x-coords, second - y-coords, third - z-coords.
poses = positions;
joints = 7;
% Get the number of "times" - time snapshots.
% "size(poses, 1)" returns a number of rows in matrix "poses"
times = size(poses,1) / 4;

% Create an animated line for Baxter's arm.
armCurve = animatedline('Marker', 'o');

% Table height. It is calculated relative to the height of S0 joint.
s0 = 1.14;          % S0 height from the floor.
table = 0.73;       % table height from the floor.   
table = table - s0; % height relative to S0.

% Space constrains for 3D plotting space.
xMin = -0.2;    xMax = 1.2;
yMin = -1;      yMax = 1;
zMin = table;   zMax = table + 1.5;

% Intersection plotting variables.
new_line = 0;
discard = 0;
drawingCurve = animatedLine();

for t = 1:3:times
    pos = poses(t:t+2, 1:joints);
    
    % Redrawing the arm.
    clearpoints(armCurve);
    addpoints(armCurve, pos(1,1:joints), pos(2,1:joints), pos(3,1:joints));
    drawnow;
    
    % Drawing the intersections.
    %   If there is a NEW intersection (no intersection before it)
    if intersectMatrix(t,4) == 1 && discard == 1
        new_line = 1;
        discard = 0;
    else
        new_line = 0;
        discard = 1;
    end
    %   Create a new animated line.
    if new_line == 1
        drawingCurve = animatedLine();
    end
    addpoints( drawingCurve, intersectMatrix(t,1),...
        intersectMatrix(t,2), intersectMatrix(t,3) )

    % The fourth matrix controls color.
    patch([xMin, xMax, xMax, xMin], [yMax, yMax, yMin, yMin],...
        [table, table, table, table], [1 1 1 1]);

    % 3D plotting space settings.
    %   Projection type (orthographic / perspective).
    camproj('perspective');
    %   Axes constraints (min and max for each)
    axis([xMin xMax yMin yMax zMin zMax]);
    %   Grid
    grid on;
    %   Labelling of axes.
    xlabel('x', 'Color', 'red');
    ylabel('y', 'Color', 'green');
    zlabel('z', 'Color', 'blue');
end

% Labelling (used the idea from the link at the bottom).
%   Names of each joints and tip of a marker.
labels = {'S0','S1','E0','E1','W0','W1','W2','tip'};
%   Avoiding labels collision.
%   Labelling at the bottom.
for j = 1:2:joints
    text(pos(1, j), pos(2, j), pos(3, j), labels{j},'VerticalAlignment','bottom');
end
%   Labelling at the top.
for j = 2:2:joints
    text(pos(1, j), pos(2, j), pos(3, j), labels{j},'VerticalAlignment','top');
end

% References:
% https://uk.mathworks.com/help/matlab/ref/text.html?searchHighlight=text&s_tid=doc_srchtitle