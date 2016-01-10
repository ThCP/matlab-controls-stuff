%% MBT front linear interpolation
% Returns the multipliers for a shot hitting in the front of the tank. In
% this case a linear interpolation was used.

function [multipliers] = MBT_front()
data = load('damage_multipliers');
v = data(1,:);
degrees = linspace (-90, 90, 181);

multipliers = zeros(size(degrees));

multipliers(1:45) = v(1)*linspace(1,45,45);
multipliers(46:60) = v(2)*linspace(46,60,15);
multipliers(61:75) = v(3)*linspace(61,15,15);
multipliers(76:90) = v(4)*linspace(1,15,15);
multipliers(91) = v(5) + multipliers(90);
multipliers(92:181) = fliplr(multipliers(1:90));


