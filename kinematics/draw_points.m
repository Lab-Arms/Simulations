function handle_out = draw_points(L, theta, ndim, handle_in);

switch nargin
case 0
	L = [10; 10; 10];
	theta = [pi/2; pi];
	ndim = 2;
	handle_out = figure('Name', 'Plano do braço');
	handle_in = handle_out;
case 1
	theta = L;
	L = [10; 10; 10];
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

	plot(jx([1 2]), jy([1 2]), 'b'); hold on;
	plot(jx([1 3]), jy([1 3]), 'b'); hold on;
	plot(jx([2 4]), jy([2 4]), 'b'); hold on;
	plot(jx([3 4]), jy([3 4]), 'b'); hold on;
	plot(jx([3 5]), jy([3 5]), 'b'); hold on;

	axis([-max(L), max(L), -.5*max(L), 2*max(L)]);
	axis on;
elseif ndim == 3
	jx = joints(:,1);
	jy = joints(:,2);
	jz = joints(:,3);

	plot3(jx([1 2]), jy([1 2]), jz([1 2]), 'b'); hold on;
	plot3(jx([1 3]), jy([1 3]), jz([1 3]), 'b'); hold on;
	plot3(jx([2 4]), jy([2 4]), jz([2 4]), 'b'); hold on;
	plot3(jx([3 4]), jy([3 4]), jz([3 4]), 'b'); hold on;
	plot3(jx([3 5]), jy([3 5]), jz([3 5]), 'b'); hold on;
	axis([-max(L), max(L), -.5*max(L), 2*max(L), -.5*max(L), 2*max(L)]);
	axis on;
end

axis equal;
