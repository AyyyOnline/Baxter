function y = tip_orientation(transform_matrices)

% The last transform matrix is the one needed
trans = transform_matrices(end-3:end, 1:4);

y = trans(1:3, 1:3);