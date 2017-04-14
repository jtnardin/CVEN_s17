%speed_calc_4_7.m updated april 4-7-2017 by JTN. Currently, the code
%appears to calculate the average speed in each compartment (we split the
%videos into 15 separate regions) and from there calculate the average cell
%speed over time in each region. That's good, but I think we probably have
%enough data to get a slightly more precise measurement of the speed over
%time as a function of time and space.

%so, my proposed plan forward is to extend this code to
% 1. keep finer track of cell speed as a function of time and space : split
% the experiment into smaller regions and look at the speed of cells in the
% smaller regions. The videos are 540x540 pixels^2, so reasonably, we could
% look into 25x25 regions, and have a 20x20 grid to estimate the average
% velocity in those regions

% 2. Should also do the same to see the average cell density over time in
% these regions. 

% So, what I foresee are two 20x20x144 arrays , cell_speed & cell_density ,
% so that cell_speed(i,j,k) denotes the avg. cell speed in x location i , y
% location j , and time k. From there, we can start investigating the
% arciero paper.

clear all; clc


if ~exist('E_03_large','var')
    load('E_03_large.mat')
end

nx = 10;
ny = 10;
nt = 144;

    
t = 0:1/3:47.7;

cell_count = zeros(ny,nx,nt);

cell_speed_x_tmp = zeros(ny,nx,144);
cell_speed_x_n = zeros(ny,nx,144);
cell_speed_y_tmp = zeros(ny,nx,144);
cell_speed_y_n = zeros(ny,nx,144);



%number of cells present
cell_no = max(E_03_large(:,1));

cell_info = cell(cell_no,1);

for i = 1:cell_no
    cell_info{i} = E_03_large(E_03_large(:,1)==i,:);
end


%should loop through cells and then the times when they are present.
%use timestep of t = 3 (i.e. 1 hours)
for i = 1:cell_no

    
    if mod(i,1000) == 0
        disp(i)
    end

    %keep track of how many time points we've gone through
    count = 1;
    
    %loop through time points that cell present
    for j = cell_info{i}(:,2)'

             
        %find its location
         %y index (for final arrays)
         yind = ceil(cell_info{i}(count,4)/54);
         if yind == 0
             yind = 1;
         end

         xind = ceil(cell_info{i}(count,3)/54);
         if xind == 0
             xind = 1;
         end

        
         %add 1 to cell count
         cell_count(yind,xind,j) = cell_count(yind,xind,j) + 1;

         %if present previously, then let's calculate its speed
         if count >= 4

            %when equal to second time
            cell_speed_x_tmp(yind,xind,j) = cell_speed_x_tmp(yind,xind,j) + (cell_info{i}(count,3)-cell_info{i}(count-3,3))/(3/3);
            cell_speed_x_n(yind,xind,j) = cell_speed_x_n(yind,xind,j) + 1;
            
            cell_speed_y_tmp(yind,xind,j) = cell_speed_y_tmp(yind,xind,j) + (cell_info{i}(count,4)-cell_info{i}(count-3,4))/(3/3);
            cell_speed_y_n(yind,xind,j) = cell_speed_y_n(yind,xind,j) + 1;

         end
        
         count = count + 1;
         
    end
    
    
end



cell_speed_x_mean = cell_speed_x_tmp./cell_speed_x_n;
cell_speed_y_mean = cell_speed_y_tmp./cell_speed_y_n;
