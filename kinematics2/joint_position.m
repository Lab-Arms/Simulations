function joints = joint_position(L, theta, ndim);

switch nargin
case 0
	L = [10; 10];
	theta = [pi/2; pi];
	ndim = 2;
case 1
	theta = L;
	L = [10; 10];
	ndim = 2;
case 2
	ndim = 2;
end

if ndim == 2
	joints = ...
		[[0, 0];
		[L(1)*cos(theta(1)), L(1)*sin(theta(1))];
		[L(1)*cos(theta(1)) + L(2)*cos(theta(1) + theta(2)), L(1)*sin(theta(1)) + L(2)*sin(theta(1) + theta(2))]];
elseif ndim == 3
	joints = ...
		[[0, 0];
		[L(1)*cos(theta(2)), L(1)*sin(theta(2))];
		[L(1)*cos(theta(2)) + L(2)*cos(theta(2) + theta(3)), L(1)*sin(theta(2)) + L(2)*sin(theta(2) + theta(3))]];

	s = joints(:,1);
	phi = mod(theta(1), 2*pi);
	z = joints(:,2);
	joints = [s, phi * ones(size(s)), z];
end
