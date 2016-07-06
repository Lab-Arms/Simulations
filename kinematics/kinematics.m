clear all;
close all;
clc;

warning off;
format compact;
format long;

points = csvread('points.csv');

if ~exist('max_counter')
	max_counter = 100;
end
if ~exist('ndim')
	ndim = size(points, 2);
end
if ~exist('tol')
	tol = 1;
end
if ~exist('passo')
	passo = 1e-2;
end
if ~exist('time_step')
	time_step = 1e-2;
end

L = [16; 5; 20];
if ndim == 2
	theta_0 = [pi/2; pi];
elseif ndim == 3
	theta_0 = [0; pi/2; pi];
end
theta = theta_0;

tetas = theta;

handle = draw_points(L, theta_0, ndim);
figure(handle);
handle2 = figure('Name', 'Ângulos dos atuadores');

for i=1:size(points,1)
	joints = joint_position(L, theta, ndim);
	if ndim == 3
		joints_cart = cylindrical2cartesian(joints);
		vel = passo * (cartesian2cylindrical(points(i,:)) - joints(5,:));
	elseif ndim == 2
		joints_cart = joints;
		vel = passo * (points(i,:) - joints(5,:));
	end
	trajectory = joints_cart(5,:);
	vel = vel(:);
	figure(handle);
	counter = 0;
	while norm(points(i,:) - joints_cart(5,:), 2) > tol && counter < max_counter
		counter = counter + 1;
		pause(time_step);
		clf(handle);
		theta = mod(theta + jacobiano_inverso(L, theta, ndim) * vel, 2*pi);
		tetas = [tetas, theta];
		joints = joint_position(L, theta, ndim);
		if ndim == 2
			plot(points(i,1), points(i,2), 'r+'); hold on;
			joints_cart = joints;
		elseif ndim == 3
			plot3(points(i,1), points(i,2), points(i,3), 'r+'); hold on;
			joints_cart = cylindrical2cartesian(joints);
		end
		trajectory = [trajectory; joints_cart(5,:)];
		draw_points(L, theta, ndim, handle);
		draw_base(L(1), handle);
		disp(sprintf('%.3f %.3f %.3f', theta(1), theta(2), theta(3)));
	end
	steps = 1:size(tetas, 2);
	if ndim == 2
		figure(handle);
		plot(points(i,1), points(i,2), 'ro');
		plot(trajectory(:,1), trajectory(:,2), 'k');
		figure(handle2); plot(steps, tetas(1,:),'b'); hold on; plot(steps, tetas(2,:), 'r');
		view(2);
		legend('\theta_1', '\theta_2');
		ylabel('rad'); xlabel('steps');
	elseif ndim == 3
		figure(handle);
		plot3(points(i,1), points(i,2), points(i,3), 'ro');
		plot3(trajectory(:,1), trajectory(:,2), trajectory(:,3), 'k');
		figure(handle2); plot(steps, tetas(1,:),'b'); hold on; plot(steps, tetas(2,:), 'r'); hold on; plot(steps, tetas(3,:),'k');
		view(2);
		legend('\theta_1', '\theta_2', '\theta_3');
		ylabel('rad'); xlabel('steps');
	end
	pause;
end

pause;
close all;
