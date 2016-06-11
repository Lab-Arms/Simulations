function handle_out = draw_points(L, theta, handle_in);

if nargin < 3
	handle_out = figure('Name', 'Plano do braço');
	handle_in = handle_out;
end

joints = joint_position(L, theta);

jx = joints(:,1);
jy = joints(:,2);

figure(handle_in);
axis equal;
clf(handle_in);

plot(jx([1 2]), jy([1 2]), 'b'); hold on;
plot(jx([1 3]), jy([1 3]), 'b'); hold on;
plot(jx([2 4]), jy([2 4]), 'b'); hold on;
plot(jx([3 4]), jy([3 4]), 'b'); hold on;
plot(jx([3 5]), jy([3 5]), 'b'); hold on;

axis([-max(L), max(L), -.5*max(L), 2*max(L)]);
axis equal;
