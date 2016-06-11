function inv_jakob = jacobiano_inverso(L, theta);

inv_jakob = ...
	[[cos(theta(2))/(L(1)*sin(theta(2)-theta(1))), sin(theta(2))/(L(1)*sin(theta(2)-theta(1)))];
	[cos(theta(1))/(L(3)*sin(theta(2)-theta(1))), sin(theta(1))/(L(3)*sin(theta(2)-theta(1)))]];
