function cells = cells_to_check(ii,jj, nodes)
    if ii==1
        up=nodes;
    else
        up = ii-1;
    end
    if  ii==nodes
        down=1;
    else 
        down=ii+1;
    end

    if jj==1
        left=nodes;
    else
        left = jj-1;
    end
    if  jj==nodes
        right=1;
    else 
        right=jj+1;
    end
    d(1) = up;
    d(2) = right;
    d(3) = down;
    d(4) = left;

    cells = d;
end