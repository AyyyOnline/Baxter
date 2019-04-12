# BaxterVisualization

This program is related to the Year 1 Semester 2 Robotics assignment. Baxter (https://en.wikipedia.org/wiki/Baxter_(robot)) is expected to write a given word on a whiteboard using a marker attached to its right arm. This particular program is created to visualize how Baxter's right arm would move and what it would write on a whiteboard given a trajectory file (table of coordinates for each joint at different points in time)


The main function is "dynamic_plotting". It accepts the trajectory file and plots Baxter's right arm (joints and connecions), a marker and a whiteboard plane as an animation.


All the joints in the code are labelled according to the manual: http://sdk.rethinkrobotics.com/wiki/Hardware_Specifications
