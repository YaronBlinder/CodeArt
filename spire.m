function [spiral,t] = spire(coords,minfeat)
% This function returns: 
% spiral - matrix of vertex coordinates (x-y)
% t - matrix of node indices for each of the triangles in the spiral
% formation
% 
% Function parameters:
% coords - vertex coordinates for original triangle to be filled with
% spiral pattern
% minfeat - minimal feature size (default = 5e-3
% 
% example:
% [p,t] = mesh2d(node);
% for i = 1:size(t,1)
%     tri= p(t(i,:),:);
%     [spiral,spi_t] = spire(tri);
% end

    if (nargin == 1)
       minfeat=5e-3; 
    end
    
    ratio = 0.1;
    new_coords = coords;
    t=zeros(1,3);
    
    new_coords(4,:) = new_coords(1,:);
    new_coords(5,:) = new_coords(2,:)+ratio*(new_coords(3,:)-new_coords(2,:));
    t(1,:) = [5,4,2];
    for i = [6:1e3]
        feature = ratio*(new_coords(i-2,:)-new_coords(i-3,:));
        norm(feature,2);
        if (norm(feature,2)<minfeat) 
            break 
        end
        new_coords(i,:) = new_coords(i-3,:)+feature;
        t(i-4,:)=[i,i-3,i-1];
    end
    spiral = new_coords;
end

    
    
    