function reten = energysym(x1, x2)
% calculate eneegy for symmetric matrix
% x1 is input, x2 is output
% both are column vectors
global W;

reten = -x1' * triu(W, 1) * x2;