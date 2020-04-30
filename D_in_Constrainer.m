D_in = OUT;
D_in_length = size(D_in,1);

data_IDs = data(:,33);

New_D_in = [];

for x = 1:length(data_IDs)
    for y = 1:D_in_length
        if data_IDs(x) == D_in(y,27)
            New_D_in = [New_D_in ; D_in(y,:)];
        end
    end
end






