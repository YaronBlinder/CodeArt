tri = [0,0;0,1;1,0];
[spiral,spi_t] = spire(tri);

figure
plot(spiral(:,1),spiral(:,2),'k'); hold on


for i = 1:size(spi_t,1)
    C=(i/size(spi_t,1))^0.75.*[1,1,1];
    fill(spiral(spi_t(i,:),1),spiral(spi_t(i,:),2),C);
end
