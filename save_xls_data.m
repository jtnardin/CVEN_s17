clear all; clc

%number of frames for x,y
ny = 2;
nx = 5;
x_range = 1:nx;
y_range = 1:ny;

B_05 = cell(ny,nx);

count = 1;

for i = y_range
    for j = x_range
                
        B_05{i,j} = PF_write(['B05_' num2str(count)]);
        
        count = count + 1;
   
    end
   
end


save B05_PF_data.mat