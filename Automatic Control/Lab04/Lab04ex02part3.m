%% Lab 04 Exercise 2
% Author: Riccardo Cappuzzo

%% Part 3
% Repeat point 1 assuming that R has uncertainty

% The delay can be neglected in this case as well, since I am still working
% on the magnitude of the transfer function.

w = logspace (-8,4); % logspace(a,b) returns a vector with extremes (10^a, 10^b)
                     % logaritmically spaced
                     
% Looping through every possible tf, I find the mag. value for each
% possible combination of the uncertain values

% I need to add one more for loop in order to combine the result with the
% uncertainty on R.

for ii = 1:length(C_unc)
    for jj = 1:length(N_unc)
        for kk = 1:length(R_unc)
            delta_M = (((C_unc(ii)^2/(2*N_unc(jj))) / ( (s+(2*N_unc(jj)/(R_unc(kk)^2*C_unc(ii)))) * (s+1/R_unc(kk)))) - G )/G;
        
            % I extract the value of magnitude of the tf obtained combining the
            % values in jj and in ii of C and N
            m = bode (delta_M, w); % true value of m, not in dB
            peak1 = max(squeeze(m)); % Squeeze is used because m is a particular type of vector

            if peak1>peak % Check whether the current max. magnitude is smaller than the one extracted above
                peak = peak1;
            end
            loglog(w, squeeze(m)), grid on, hold on; % plot the current tf, by using hold on I keep every tf on the same graph
        end
    end
end
gammaT = peak % The value of gammaT is the max value of the magnitude, which is defined in the for loops above

