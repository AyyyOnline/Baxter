# BaxterVisualization

To see the visualization, type the following commands in MATLAB's command Window:

load horLine.dat

tip = 0.2;

base = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

poses = get_positions_sequence(horLine, 'right', tip, base);

dynamic_plotting(poses)


You will see that the arm is making some subtle movement.
I am not sure if that visualization represents reality, but it looks plausible for now.

All the joint are labelled like in the manual: http://sdk.rethinkrobotics.com/wiki/Hardware_Specifications

"Tip" represents a tip of the marker

The blue-ish plane represents a table (I must lift it higher, but I don't have the height measurements)


Explaning the commands written above:

Line 1: "load horLine.dat"
It loads the coordinates file. But mind that I have removed the first row from the original file
we got from Baxter, because it contained letters and MATLAB could not read them

Line 2: "tip = 0.2
Defines a distance (in meters) from the last joint (W2) to the tip of a marker (rought approximation)

Line 3: "base = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];"
Coordinates of S0 (the beginning of the arm) in a form of tranlation matrix (don't ask why :D )

Line 4: "poses = get_positions_sequence(horLine, 'right', tip, base);"
Produces a long table of positions for every joint (and tip) at each point in time

Line 5: "dynamic_plotting(poses)"
Draws the arm
