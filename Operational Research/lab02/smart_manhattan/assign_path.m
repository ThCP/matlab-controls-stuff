function L = assign_path(L,s,d ,cells, ii, jj)
    L(ii,jj) = s;
    if (L(cells(1), jj)) == 0
        L(cells(1), jj) = d;
    elseif (L(ii, cells(2))) == 0
        L(ii, cells(2)) = d;
    elseif (L(cells(3), jj)) == 0
        L(cells(3), jj) = d;
    elseif (L(ii, cells(4))) == 0
        L(ii, cells(4)) = d;
    else % 
    end
end
