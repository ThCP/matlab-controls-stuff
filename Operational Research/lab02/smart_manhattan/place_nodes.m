function bij = place_nodes (bij, cells, ii, jj, L)
% I find the value in cell (ii,jj) of matrix L (which is the name of a
% node) and I place in the corresponding row in the bij matrix 1 in the
% columns corresponding to the nodes found in the adjacent cells.
bij(L(ii, jj), L(cells(1), jj)) = 1;
bij(L(ii, jj), L(ii, cells(2))) = 1;
bij(L(ii, jj), L(cells(3), jj)) = 1;
bij(L(ii, jj), L(ii, cells(4))) = 1;