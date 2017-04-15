clear all; clc

%number of frames for x,y
ny = 2;
nx = 5;
x_range = 1:nx;
y_range = 1:ny;


for k = 1:6
    for l = 2:5



        A = cell(ny,nx);

        count = 1;

        for i = y_range
            for j = x_range

                A{i,j} = PF_write([char(k+65) '0' num2str(l) '_' num2str(count)]);

                count = count + 1;

            end

        end


        save([char(k+65) '0' num2str(l) '_large.mat'])
        
    end
end