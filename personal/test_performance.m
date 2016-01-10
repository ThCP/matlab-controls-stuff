%% test for
profile on;
for i = 1:0.0001:20
    for j = 7:12
        d = i * j;
    end 
end
profile off
profview
pause
profile on;
i = 1:0.0001:20;
for j = 1:21
    k(j,:) = i;
end

profile off
profview
