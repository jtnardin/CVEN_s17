%written 4-15-17 by JTN to plot the speed and density results from PF

clear all; clc

x = linspace(0,540,10);
y = linspace(0,540,10);

[X,Y] = meshgrid(x,y);

wellvid = 'E03';
vidObj = VideoReader(['WL_3_well ' wellvid '.avi']);


load([wellvid '_large'])

xspeedmean = nanmean(nanmean(nanmean(cell_speed_x_mean)));
yspeedmean = nanmean(nanmean(nanmean(cell_speed_y_mean)));


i = 1;
while hasFrame(vidObj)
    
    subplot(1,2,1)
    
    hold off
    
    image(readFrame(vidObj))
    
    axis([0 540 0 540])
  
    hold on
    
    normfactor = sqrt(xspeedmean^2 + yspeedmean^2)*10/540;    

    q = quiver(X,Y,cell_speed_x_mean(:,:,i)/normfactor,cell_speed_y_mean(:,:,i)/normfactor,0);

    q.AutoScale = 'off';
    q.Color = 'r';
    
    
    set(gca,'Ydir','Reverse')
    
    view(2)
    title(num2str(i))
    
    
    
    
    subplot(1,2,2)
    
    hold off
    
    contourf(X,Y,cell_count(:,:,i),'edgecolor','none')
    
    view(2)
    
    colorbar
    
    hold on
    
    
    q = quiver(X,Y,cell_speed_x_mean(:,:,i)/normfactor,cell_speed_y_mean(:,:,i)/normfactor,0);

    q.AutoScale = 'off';
    q.Color = 'r';
    
    axis([0 540 0 540])
    
    set(gca,'Ydir','Reverse')
    
%     caxis([0 50])
%     colorbar
    
    view(2)
    
    
    
    
    pause(.5)
    
    i = i + 1;
end