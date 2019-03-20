% 'arm' values: 'right' or 'left'
function poses = get_positions_sequence(data, arm, tip, base)

if strcmp(arm, "left")
    angle_sequence = data(2:size(data,1), 2:8);
elseif strcmp(arm, "right")
    angle_sequence = data(2:size(data,1), 10:16);
end

sequences = size(angle_sequence, 1);

poses = [];
for s=1:sequences
    pos = compound(angle_sequence(s,:), tip, base);
    poses = vertcat(poses, pos);
end
