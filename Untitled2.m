close all
% 
% dtheta = pi/12;
% theta  = (-pi:dtheta:(pi-dtheta))';
% node   = [cos(theta) sin(theta)];

% a=figure;  
% % Make mesh
% [p,t] = mesh2d(node);

% Geometry
% dtheta = pi/24;
% theta  = (-pi:dtheta:(pi-dtheta))';
% node   = [cos(theta) sin(theta)];

% I = imread('moran.jpg');
% I(:,1022,:)=[];

I = imread('flower.jpg');
size_X = size(I,1);
size_Y = size(I,2);
node = [
0   0
% 0.1*size_X   0
0.2*size_X   0
% 0.33*size_X   0
0.4*size_X   0
% 0.5*size_X   0
0.6*size_X   0
% 0.7*size_X   0
0.8*size_X   0
% 0.9*size_X   0
size_X   0
% size_X   0.1*size_Y
size_X   0.2*size_Y
% size_X   0.33*size_Y
size_X   0.4*size_Y
% size_X   0.5*size_Y
size_X   0.6*size_Y
% size_X   0.7*size_Y
size_X   0.8*size_Y
% size_X   0.9*size_Y
size_X   size_Y
% 0.9*size_X   size_Y
0.8*size_X   size_Y
% 0.7*size_X   size_Y
0.6*size_X   size_Y
% 0.5*size_X   size_Y
0.4*size_X   size_Y
% 0.33*size_X   size_Y
0.2*size_X   size_Y
% 0.1*size_X   size_Y
0   size_Y
% 0   0.9*size_Y
0   0.8*size_Y
% 0   0.7*size_Y
0   0.6*size_Y
% 0   0.5*size_Y
0   0.4*size_Y
% 0   0.33*size_Y
0   0.2*size_Y
% 0   0.1*size_Y
];
I_gray = rgb2gray(I);
I_temp=zeros(size(I_gray));
% Make mesh
[p,t] = mesh2d(node);
for i = 1:size(t,1)
    tri= p(t(i,:),:);
    [spiral,spi_t] = spire(tri,0.1);
    
    plot(spiral(:,1),spiral(:,2),'k');hold on;
%     for i = 1:size(spi_t,1)
%         C=(1-(i/size(spi_t,1))^0.5).*[1,1,1];
%         fill(spiral(spi_t(i,:),1),spiral(spi_t(i,:),2),C);
%     end

%     for j=1:size(spi_t,1)
%         c=round(spiral(spi_t(j,:),1));
%         r=round(spiral(spi_t(j,:),2));
%         BW = roipoly(I_gray,c,r);
%         I_temp(find(BW)) = mean(I_gray(find(BW)));
    % %     h = fspecial('average',[100 ,100]);
    % %     if (min(size(BW))>0)
    % %         I_gray = roifilt2(h,I_gray,BW);
    % %         print('work')
    % %     else
    % %         print('not')
    % %     end
    end
end

se = strel('disk',3);
I_temp = imclose(I_temp,se);
figure;
subplot(131)
imshow(I_gray);
title('original')
subplot(132)
imshow(I_temp/(max(max(I_temp))));
title('Spiral filter')
A=imgaussfilt(I_temp,2);
subplot(133)
imshow(A/(max(max(A))));
title('Spiral + gaussian')

% colormap(gray);