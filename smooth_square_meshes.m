hdata = [];
options.output = false;
hdata.hmax = 0.1;

node = [0 0; 1 0; 1 1; 0 1];              % Simple square example

[p,t] = mesh2d(node,[],hdata,options);    % Auto size fun only

figure
% subplot(2,2,1)
patch('faces',t,'vertices',p,'facecolor','none','edgecolor','b');
axis equal off; hold on;
title('Uniform mesh from MESH2D')
for i = 1:size(t,1)
    tri= p(t(i,:),:);
    [spiral,spi_t] = spire(tri,1e-4);
    
    plot(spiral(:,1),spiral(:,2),'k');hold on;
end

node = [0.3,0.3; 0.7,0.3; 0.7,0.7; 0.3,0.7];

in = inpoly(p,node);
ti = sum(in(t),2)>0;
[p,t] = refine(p,t,ti);

figure
% subplot(2,2,2)
patch('faces',t,'vertices',p,'facecolor','none','edgecolor','b');
axis equal off; hold on;
title('Mesh refined in centre region using REFINE')
for i = 1:size(t,1)
    tri= p(t(i,:),:);
    [spiral,spi_t] = spire(tri,1e-4);
    
    plot(spiral(:,1),spiral(:,2),'k');hold on;
end

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
