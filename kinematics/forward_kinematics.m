clear all;
close all;
clc;

warning off;
format compact;
format long;

tol = 1;
step = 1e-2;

L = [16; 5; 20];
theta_0 = [pi/2; pi];
theta = theta_0;

handle = draw_points(L, theta_0);

[pos_x, pos_y] = ginput(1);
joints = joint_position(L, theta);
vel = step * ([pos_x, pos_y] - joints(5,:));
vel = vel(:);
figure(handle);
pos = [pos_x, pos_y];

while 1
	if (norm(pos - joints(5,:)) < 1)
		[pos_x, pos_y] = ginput(1);
		joints = joint_position(L, theta);
		vel = 1e-2 * ([pos_x, pos_y] - joints(5,:));
		vel = vel(:);
		figure(handle);
		pos = [pos_x, pos_y];
		continue;
	end
	pause(.01);
	theta = theta + jacobiano_inverso(L, theta) * vel;
	draw_points(L, theta, handle);
	plot(pos_x, pos_y, 'r+'); hold on;
	joints = joint_position(L, theta);
end

pause;
close all;
