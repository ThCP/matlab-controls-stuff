%% Plot damage
% Plots the damage graph. 
% Syntax: plotDamageGraph (base_damage, multipliers)

function [] = plotDamageGraph (base_damage, multipliers)

n = -90:1:90;
damageInflicted = base_damage*multipliers;

% figure;
plot (n, damageInflicted);