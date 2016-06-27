function inv_jakob = jacobiano_inverso(L, theta, ndim);

if ndim == 2
	inv_jakob = ...
		[[cos(theta(1)+theta(2)), sin(theta(1)+theta(2))]/(L(1)*sin(theta(2)));
		-[L(2)*cos(theta(1)+theta(2)) + L(1)*cos(theta(1)), L(2)*sin(theta(1)+theta(2)) + L(1)*sin(theta(1))]/(L(1)*L(2)*sin(theta(2)))];
elseif ndim == 3
	inv_jakob = ...
		[[0, 1, 0];
		[cos(theta(2)+theta(3)), 0, sin(theta(2)+theta(3))]/(L(1)*sin(theta(3)));
		-[L(2)*cos(theta(2)+theta(3))+L(1)*cos(theta(2)), 0, L(2)*sin(theta(2)+theta(3)) + L(1)*sin(theta(2))]/(L(1)*L(2)*sin(theta(3)))];
end
