
average_scaled_cost = [];

for x = 1:size(Water1000,1)
    found = 0;
    for y = 1:size(Water2000,1)
        if Water1000(x,2) == Water2000(y,2)
            average_scaled_cost = [average_scaled_cost;[(Water1000(x,1) + Water2000(y,1))./2, Water1000(x,2)]];
            found = 1;
            break
        end
    end
    if found == 0
        average_scaled_cost = [average_scaled_cost;[1000, Water1000(x,2)]];
    end
end

average_scaled_cost2 = [];

for x = 1:size(Water1500,1)
    found = 0;
    for y = 1:size(average_scaled_cost,1)
        if Water1500(x,2) == average_scaled_cost(y,2)
            average_scaled_cost2 = [average_scaled_cost2;[average_scaled_cost(y,1), Water1500(x,2)]];
            found = 1;
            break
        end
    end
    if found == 0
        average_scaled_cost2 = [average_scaled_cost2;[1000, Water1500(x,2)]];
    end
end