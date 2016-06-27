function draw_base(side, handle);

figure(handle);
[x, y] = meshgrid([-side/2, side/2]);
z = zeros(size(x));
surf(x,y,z);
