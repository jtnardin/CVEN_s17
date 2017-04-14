E_03_large = E_03{1,1};

%needs to be updated for 2x5 case -- JTN

for i = 2:5
    E_03_tmp = E_03{1,i};
    E_03_tmp(:,3) = E_03_tmp(:,3) + (i-1)*108;
    E_03_tmp(:,1) = E_03_tmp(:,1) + max(E_03_large(:,1));
    
    E_03_large = [E_03_large ; E_03_tmp];
end


