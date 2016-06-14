%% bij smart_manhattan

function bij = bij_smart_manhattan(L)

nodes = size(L,1);

bij = zeros(nodes^2, nodes^2);

count = 1;
for ii = 1:nodes
    for jj = 1:nodes
        cells = cells_to_check(ii,jj, nodes);
        bij = place_nodes(bij, cells, count, ii, jj, L);
        count = count + 1;
    end
end