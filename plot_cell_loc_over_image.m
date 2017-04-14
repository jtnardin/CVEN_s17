%written 4-14-17 to plot where cells from PF are located

save_vid = 0;

% %read in PF data
% A = xlsread(['WL_3_well E03_crop_Analysis.xls']);
% 
% B = A(3:end,1:4);

n = 1;

ny = 2;
nx = 5;

wellvid = 'B05';

%read in from E03
load([wellvid '_PF_data.mat'])

yind = ceil(n/nx);
xind = mod(n,nx);
xind(xind==0)=nx;

B = B_05{yind,xind};


vidObj = VideoReader(['WL_3_well ' wellvid '_' num2str(n) '.avi']);

%save video?
if save_vid == 1
    writerObj = VideoWriter('dots_on_data.avi');
    writerObj.FrameRate = 5;
    open(writerObj);
end

count = 1;

while hasFrame(vidObj)

    hold off
    
    image(readFrame(vidObj))
    
    axis([0 100 0 540])
    
    hold on
    %plot imagej data
%     subplot(1,2,1)
    
    cells_pres = B(:,2)==count;
    
    plot(B(cells_pres,3),B(cells_pres,4),'r.')
    
    set(gca,'Ydir','reverse')
    
    title(['Density 2 with EGf, t = ' num2str(floor(count/3)) ' hours'])
    
    axis([0 100 0 270])
    
    %plot image
%     subplot(1,2,2)
    
    pause(.125)
    
    if save_vid == 1
        frame = getframe(gcf);
        writeVideo(writerObj,frame);
    end
    
    count = count + 1;
end

if save_vid == 1
    close(writerObj);
end