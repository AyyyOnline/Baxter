function plot_intersection(height, W2, tip)

% Define a number of iterations.
cycles = size(W2, 1);

% Space constrains.
xMin = -1;          xMax = 1.2;
yMin = -1;          yMax = 1;
zMin = height-1;    zMax = height+1;

% Normal to the table plane
n = [0,0,height];
% Point on a plane
v0 = [0,0,height];

% Get the curves for Arm and drawings
arm = animatedline();

for c = 1:cycles
    % The fourth value in each matrix is for color.
    patch([xMin, xMax, xMax, xMin], [yMax, yMax, yMin, yMin],...
        [height, height, height, height], [1 1 1 1]);

    % Drawing.
    clearpoints(arm);
    addpoints(arm, [W2(c,1), tip(c,1)], [W2(c,2), tip(c,2)],...
      [W2(c,3), tip(c,3)])
    drawnow;
    pause(0.01);
    
    % Getting the intersection point
    %intersect = plane_line_intersect(n, v0, W2, tip);
    %if intersect(2) == 1
        
    %end
    
    % Plotting settings.
    camproj('perspective');
    view(0,45);
    axis([xMin xMax yMin yMax zMin zMax]);
    grid on;
    xlabel('x', 'Color', 'red');
    ylabel('y', 'Color', 'green');
    zlabel('z', 'Color', 'blue');
end