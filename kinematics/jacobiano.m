function jakob = jacobiano(L, theta);

jakob = ...
	[[-L(1)*sin(theta(1)), L(3)*sin(pi-theta(2))];
	[L(1)*cos(theta(1)), L(3)*cos(pi-theta(2))]];
