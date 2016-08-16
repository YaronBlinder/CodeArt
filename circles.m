% Geometry
dtheta = pi/30;
theta  = (-pi:dtheta:(pi-dtheta))';
node   = [cos(theta) sin(theta)];

% Make mesh
[p,t] = mesh2d(node);
[p,t] = smoothmesh(p,t);

figure
% subplot(2,2,3)
patch('faces',t,'vertices',p,'facecolor','none','edgecolor','b');
axis equal off; hold on;
title('Smoothed mesh using SMOOTHMESH')
for i = 1:size(t,1)
    tri= p(t(i,:),:);
    [spiral,spi_t] = spire(tri,1e-4);
    
    plot(spiral(:,1),spiral(:,2),'k');hold on;
end