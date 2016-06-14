function L = smart_manhattan(trf_m)

nodes = size(trf_m,1);
size_L = sqrt(nodes);
% define the lightpath matrix
L = zeros(size_L, size_L);
% define the assigned paths array
S =  zeros(nodes, 1);

n_delta = 4;

%% assign values to struct
% I create an array of structs which contain info about every edge
arcs = generateArcs(trf_m, nodes);

%% sort arcs by load
% I sort all the arcs array by traffic transmitted
arcsSorted = sortArcsValue(arcs);

%%
for ii = 1:length(arcsSorted)
    s = arcsSorted(ii).tx;
    d = arcsSorted(ii).rx;
    
    if S(s) == 0 && S(d) == 0
        % neither s nor d are present in S
        % point 3
        L_new = place_sd(L,s,d);
        if sum(sum(L_new-L)) ~= 0
            L = L_new;
            S(d) = 1;
            S(s) = 1;
        end
    elseif S(s) + S(d) == 1
        % either s or d was placed
            % point 4
        if S(s) == 1
            [r,c] = find(L==s);
            cells = cells_to_check(r,c, size_L);
            L_new = assign_path(L, s,d, cells, r, c);
            if sum(sum(L_new-L)) ~= 0
                L = L_new;
                S(d) = 1;
            end
         else
            [r,c] = find(L==d);
            cells = cells_to_check(r,c, size_L);
            L_new = assign_path(L, d, s, cells, r, c);
            if sum(sum(L_new-L)) ~= 0
                S(s) = 1;
                L = L_new;
            end
        end
            
    else 
        % both s and d were placed, check whether L still has free
        % positions
        if sum(size(find(~L))) == 0
            break;
        end
    end 
end


    