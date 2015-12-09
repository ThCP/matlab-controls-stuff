%% TCP congestion control

close all, clear all, clc;

%% DATA
adv_wnd = 40; % advised window size
starting_cwnd = 1;
cwnd = starting_cwnd; % window size
ssthresh = adv_wnd; % threshold
link_speed = 50;

N = 1000;

errors = sort(randi(N,1,20));
% errors = [10 40 55 60 102 140 200 421 500 502 601 670 700 723 800 900 950 953 992 999];
ack_reception = errors + randi(20, 1, 20);
cum_errors = zeros(1,N);
result = zeros (1,N);

ercnt = 1; % error count

%% Congestion avoidance
for ii=1:N
    if (ercnt < length(errors) && ii == errors(ercnt))
        % timeout expired
        disp(ercnt);
        ssthresh = min(cwnd, adv_wnd)/2;
        cwnd = starting_cwnd;
        cum_errors(ii:length(cum_errors)) = ercnt * ones(size(ii:length(cum_errors)));
        ercnt=ercnt+1;
        
        % ack received
    elseif (cwnd > ssthresh)
        cwnd = cwnd+1;
    else
        cwnd = cwnd+cwnd;
    end
    if (cwnd > link_speed)
        cwnd = link_speed;
    end
    
    result(ii) = cwnd;
end

figure
plot (1:N, result/link_speed);
title('standard congestion avoidance');
% plot (1:N, cum_errors/length(errors));

%% Congestion avoidance with cwnd=10 start
starting_cwnd = 10;
cwnd = starting_cwnd;
ercnt = 1; % error count

for ii=1:N
    if (ercnt < length(errors) && ii == errors(ercnt))
        % timeout expired
        disp(ercnt);
        ssthresh = min(cwnd, adv_wnd)/2;
        cwnd = starting_cwnd;
        cum_errors(ii:length(cum_errors)) = ercnt * ones(size(ii:length(cum_errors)));
        ercnt=ercnt+1;
        
        % ack received
    elseif (cwnd > ssthresh)
        cwnd = cwnd+1;
    else
        cwnd = cwnd+cwnd;
    end
    if (cwnd > link_speed)
        cwnd = link_speed;
    end
    
    result(ii) = cwnd;
end

figure
plot (1:N, result/link_speed);
title ('fast start');
% plot (1:N, cum_errors/length(errors));
% return
%% Fast retransmit
starting_cwnd = 1;
cwnd = starting_cwnd; % window size
ercnt = 1;


fast_flag = 0;
for ii=1:N
    if (ercnt < length(errors) && ii == errors(ercnt))
        % timeout expired
        fast_flag = 1;
        disp(ercnt);
        ssthresh = min(cwnd, adv_wnd)/2;
        cwnd = ssthresh+3;
        cum_errors(ii:length(cum_errors)) = ercnt * ones(size(ii:length(cum_errors)));
        ercnt=ercnt+1;
        
        % ack received
    elseif (fast_flag == 1)
        cwnd = cwnd+cwnd;
        if (ercnt < length(errors) && ii == ack_reception(ercnt))
            % ack received
            fast_flag = 0;
            cwnd = ssthresh;
        end
    elseif (cwnd >= ssthresh)
        cwnd = cwnd+1;
    else
        cwnd = cwnd+cwnd;
    end
    if (cwnd > link_speed)
        cwnd = link_speed;
    end
    
    result(ii) = cwnd;
end

figure
plot (1:N, result/link_speed);
title('fast retransmit');
