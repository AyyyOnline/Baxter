% Include the height of the first joint from the floor.

function dynamic_plotting(positions)

% First row is x-coords, second - y-coords, third - z-coords.
poses = positions;
joints = size(poses,2);
reps = size(poses,1) / 4;

curve = animatedline('Marker', 'o');

% Space constrains.
xMin = -0.2;    xMax = 1.2;
yMin = -1;      yMax = 1;
zMin = -1;      zMax = 1;

% Drawing table surface.
table = -0.5;   % Table height.

% Labels storage.
id = [];

for r=1:3:reps
    pos = poses(r:r+2, 1:joints);
    
    % Drawing.
    clearpoints(curve);
    addpoints(curve, pos(1,1:joints), pos(2,1:joints), pos(3,1:joints));
    drawnow;

    % The fourth value in each matrix is for color.
    patch([xMin, xMax, xMax, xMin], [yMax, yMax, yMin, yMin],...
        [table, table, table, table], [1 1 1 1]);

    % Plotting settings.
    camproj('perspective');
    axis([xMin xMax yMin yMax zMin zMax]);
    grid on;
    xlabel('x', 'Color', 'red');
    ylabel('y', 'Color', 'green');
    zlabel('z', 'Color', 'blue');
end

% Labelling.
% https://uk.mathworks.com/help/matlab/ref/text.html?searchHighlight=text&s_tid=doc_srchtitle
labels = {'S0','S1','E0','E1','W0','W1','W2','tip'};
% Avoiding labels collision.
for j=1:joints
    if rem(j,2) == 1
        text(pos(1, j), pos(2, j), pos(3, j), labels{j},'VerticalAlignment','bottom');
    else
        text(pos(1, j), pos(2, j), pos(3, j), labels{j},'VerticalAlignment','top');
    end
end