Constraints = [1 0 0.3 0 0 ; 2.5 1.5 1 0.5*10^5 0.5*10^5];
Counters = zeros(1,5);
Rows_to_delete = [];
for row = 1:size(data,1)
    if data(row,4) < Constraints(1,1) || data(row,4) > Constraints(2,1)
        Rows_to_delete = [Rows_to_delete row];
        Counters(1) = Counters(1) + 1;
    end
    if data(row,6) < Constraints(1,2) || data(row,6) > Constraints(2,2)
        Rows_to_delete = [Rows_to_delete row];
        Counters(2) = Counters(2) + 1;
    end
    if data(row,12) < Constraints(1,3) || data(row,12) > Constraints(2,3)
        Rows_to_delete = [Rows_to_delete row];
        Counters(3) = Counters(3) + 1;
    end
    if data(row,17) < Constraints(1,4) || data(row,17) > Constraints(2,4)
        Rows_to_delete = [Rows_to_delete row];
        Counters(4) = Counters(4) + 1;
    end
    if data(row,18) < Constraints(1,5) || data(row,18) > Constraints(2,5)
        Rows_to_delete = [Rows_to_delete row];  
        Counters(5) = Counters(5) + 1;
    end
    
    for t = 1:size(D_in,1)
        if D_in(27) == data(row, 33)
            InputTubeThickness = (D_in(1) - D_in(3)) * 2.54 * 10^(-2);
            if InputTubeThickness < data(row, 20)
                Rows_to_delete = [Rows_to_delete row];
                Counters(6) = Counters(6) + 1;
                break
            end
        end
    end
end

Rows_to_delete = unique(Rows_to_delete);
for x = length(Rows_to_delete):-1:1
    data(Rows_to_delete(x),:) = [];
end