function joints = joint_position(L, theta);

joints = ...
	[[0, 0];
	[L(2)*cos(theta(2)), L(2)*sin(theta(2))];
	[L(1)*cos(theta(1)), L(1)*sin(theta(1))];
	[0,0];
	[0,0]];

joints(4,:) = joints(2,:) + joints(3,:);
joints(5,:) = joints(3,:) + [L(3)*cos(pi-theta(2)), -L(3)*sin(pi-theta(2))];
