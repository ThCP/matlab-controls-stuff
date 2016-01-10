%% Plot by damage
% Syntax: plotByDamage (base_damage)

function plotByDamage (base_damage)

close all;


front = MBT_front;
side = MBT_side;
rear = MBT_rear;
top = MBT_top;
ifv = IFV;
fac = FAC;

plotDamageGraph(base_damage, front);
hold on;
plotDamageGraph(base_damage, side);
plotDamageGraph(base_damage, rear);
plotDamageGraph(base_damage, top);

legend ('front', 'side', 'rear', 'top');
% ylim([20, 100]);
% xlim([-45, 45]);

figure
plotDamageGraph(base_damage, ifv);
legend ('ifv');

figure
plotDamageGraph(base_damage, fac);
legend ('fac');


