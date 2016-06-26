function joints_cartesian = cylindrical2cartesian(joints_cylindrical);

joints_cartesian = zeros(size(joints_cylindrical));

s = joints_cylindrical(:,1);
phi = mod(joints_cylindrical(:,2), 2*pi);
z = joints_cylindrical(:,3);

joints_cartesian = [s .* cos(phi), s .* sin(phi), z];
