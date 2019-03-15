% Include the height of the first joint from the floor.

function plot_robot(positions)

% First row is x-coords, second - y-coords, third - z-coords.
pos = positions;
joints = size(pos,2);
%reps = size(poses,1) / 4;

curve = animatedline('Marker', 'o');

% Drawing.
clearpoints(curve);
addpoints(curve, pos(1,1:joints), pos(2,1:joints), pos(3,1:joints));
drawnow;

% Labelling.
% https://uk.mathworks.com/help/matlab/ref/text.html?searchHighlight=text&s_tid=doc_srchtitle
labels = {'S0','S1','E0','E1','W0','W1','W2','tip'};
% Avoiding labels collision.
for j=1:joints
    if rem(j,2) == 1
        id = text(pos(1, j), pos(2, j), pos(3, j), labels{j},'VerticalAlignment','bottom');
    else
        id = text(pos(1, j), pos(2, j), pos(3, j), labels{j},'VerticalAlignment','top');
    end
end

% Space constrains.
xMin = -0.2;    xMax = 1.2;
yMin = -1;      yMax = 1;
zMin = -1;      zMax = 1;

% Drawing table surface.
table = -0.5;   % Table height.
% The fourth value in each matrix is for color.
patch([xMin, xMax, xMax, xMin], [yMax, yMax, yMin, yMin],...
    [table, table, table, table], [1 1 1 1]);

% Plotting settings.
camproj('perspective');
view(0,0);
axis([xMin xMax yMin yMax zMin zMax]);
grid on;
xlabel('x', 'Color', 'red');
ylabel('y', 'Color', 'green');
zlabel('z', 'Color', 'blue');

