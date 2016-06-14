%% place both nodes

function L = place_sd (L, s, d)
    size_L = size(L,1);

    for ii=1:size_L
        for jj=1:size_L
            if L(ii, jj) == 0 % free slot
                cells = cells_to_check(ii, jj, size_L);
                L_new = assign_path(L, s, d, cells, ii, jj);
                %if sum(sum(L_new-L)) ~= 0 
                 if find (L~=L_new) ~= 1
                    L = L_new;
                    return
                else
                    L(ii, jj) = 0;
                    continue;
                end
            end
        end
    end
end
