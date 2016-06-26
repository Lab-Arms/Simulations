function joints_cylindrical = cartesian2cylindrical(joints_cartesian);

x = joints_cartesian(:,1);
y = joints_cartesian(:,2);
z = joints_cartesian(:,3);

joints_cylindrical = [abs(x+1i*y), mod(atan2(y, x), 2*pi), z];
