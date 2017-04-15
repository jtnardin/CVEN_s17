%combine_cells -- go from individual parts of PF data to one large array



%number of subsections used in x and y
nx = 5;
ny = 2;

for k = 1:6
    for l = 2:5
        
        load([char(k+65) '0' num2str(l) '_large.mat'])


        A_large = [];


        count = 1;

        for i = 1:ny
            for j = 1:nx

                A_tmp = A{i,j};
                %update x dimension
                A_tmp(:,3) = A_tmp(:,3) + (j-1)*108;
                %update y dimension
                A_tmp(:,4) = A_tmp(:,4) + (i-1)*270;


                %update cell counts

                if count ~= 1
                    A_tmp(:,1) = A_tmp(:,1) + max(A_large(:,1));
                end

                %update large matrix
                A_large = [A_large ; A_tmp];

                count = count+1;

            end
        end

        save([char(k+65) '0' num2str(l) '_large.mat'],'A_large')


    end
end