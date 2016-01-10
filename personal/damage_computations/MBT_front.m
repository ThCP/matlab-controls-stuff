%% MBT front
% Returns the multipliers for a shot hitting in the front of the tank

function [multipliers] = MBT_front()
data = load('damage_multipliers');
v = data(1,:);
degrees = linspace (-90, 90, 181);

multipliers = zeros(size(degrees));

multipliers(1:45) = v(1)*ones(1,45);
multipliers(46:60) = v(2)*ones(1,15);
multipliers(61:75) = v(3)*ones(1,15);
multipliers(76:90) = v(4)*ones(1,15);
multipliers(91) = v(5);
multipliers(92:181) = fliplr(multipliers(1:90));

