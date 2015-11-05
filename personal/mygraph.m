%% Experiments with graph functions

close all, clear all, clc;

n = [ 1 2 3 3 ];
t = [ 2 3 4 5 ];
w = [ 34 100 100 100 ];

G = graph(n, t, w)
figure
plot (G, 'EdgeLabel', G.Edges.Weight);

A = [ 0 34 0 0 0;
      34 0 100 0 0;
      0 100 0 100 100;
      0 0 100 0 0;
      0 0 100 0 0; ]

G2 = graph(A)
figure
plot (G2, 'EdgeLabel', G2.Edges.Weight);
