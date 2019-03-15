% Brings all the functions for transformations
% Returns the joints positions.
function pos = compound(angles, tip, base)

dh = get_parameters(angles, tip);
trans = dh_transform_matrix(dh);
pos = transform_joints(trans, base);
