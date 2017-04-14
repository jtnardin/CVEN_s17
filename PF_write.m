%read in .xlsx file from PF and calculate motility over time

function B = PF_write(name)

    %read in whole sheet
    A = xlsread(['WL_3_well ' name '_Analysis.xls']);

    if isempty(A)
        
        B = [];
    else
        %extract part that we need -- cell ID, time points, x- and y-location
        B = A(3:end,1:4); 
    end
    
end