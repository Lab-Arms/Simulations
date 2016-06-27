function handle_out = draw_points(L, theta, ndim, handle_in);

switch nargin
case 0
	L = [10; 10];
	theta = [pi/2; pi];
	ndim = 2;
	handle_out = figure('Name', 'Plano do braço');
	handle_in = handle_out;
case 1
	theta = L;
	L = [10; 10];
	ndim = 2;
	handle_out = figure('Name', 'Plano do braço');
	handle_in = handle_out;
case 2
	ndim = 2;
	handle_out = figure('Name', 'Plano do braço');
	handle_in = handle_out;
case 3
	handle_out = figure('Name', 'Plano do braço');
	handle_in = handle_out;
end

if ndim == 3
	joints = cylindrical2cartesian(joint_position(L, theta, ndim));
else
	joints = joint_position(L, theta, ndim);
end

figure(handle_in);

if ndim == 2
	jx = joints(:,1);
	jy = joints(:,2);

	plot(jx, jy, 'b'); hold on;

	axis([-max(L), max(L), -.5*max(L), 2*max(L)]);
	axis on;
elseif ndim == 3
	jx = joints(:,1);
	jy = joints(:,2);
	jz = joints(:,3);

	plot3(jx, jy, jz, 'b'); hold on;
	axis([-max(L), max(L), -.5*max(L), 2*max(L), -.5*max(L), 2*max(L)]);
	axis on;
end

axis equal;
