%written 4-14-17 to plot where cells from PF are located



% %read in PF data
% A = xlsread(['WL_3_well E03_5_Analysis.xls']);

% B = A(3:end,1:4);

%read in from E03
% load('PF_april_cropping.mat')
% B = E_03{1,5};

B = E_03_large;


for count = 1:144 

    
    cells_pres = B(:,2)==count;
    
    plot(B(cells_pres,3),B(cells_pres,4),'r.')
    
    set(gca,'Ydir','reverse')
    
    title(['Density 2 with EGf, t = ' num2str(floor(count/3)) ' hours'])
    
    axis([0 540 0 540])
    
    
    pause(.125)
    
    count = count + 1;
end
