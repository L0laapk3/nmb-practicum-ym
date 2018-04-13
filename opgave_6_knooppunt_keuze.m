figure
% Linkse subplot toont heaviside
subplot(1, 2, 1);
degree = 3;
nodes = linspace(-3, 3, 5)
nb_nodes = length(nodes);
x = linspace(nodes(1), nodes(nb_nodes), 200);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
y = heaviside(x);
res = kkb_spline(nodes, x, y, x, degree);
plot(x,res, '.r');
title('Benadering heaviside(x)');
hold on

nodes = linspace(-3, 3, 11)
nb_nodes = length(nodes);
x = linspace(nodes(1), nodes(nb_nodes), 200);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
y = heaviside(x);
res = kkb_spline(nodes, x, y, x, degree);
plot(x, res, '--b');
hold on

nodes = [-3, 0, 0, 0, 0, 3]
nb_nodes = length(nodes);
x = linspace(nodes(1), nodes(nb_nodes), 200);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
y = heaviside(x);
res = kkb_spline(nodes, x, y, x, degree);
plot(x, res, '-k');
hold on

% Rechtse subplot toont gebroken lijn
subplot(1, 2, 2);
nodes = linspace(-1, 1, 5)
nb_nodes = length(nodes);
x = linspace(nodes(1), nodes(nb_nodes), 200);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
y = heaviside(x).*x;
res = kkb_spline(nodes, x, y, x, degree);
plot(x, res, '.r');
title('Benadering heaviside(x)*x');
hold on

nodes = linspace(-1, 1, 11)
nb_nodes = length(nodes);
x = linspace(nodes(1), nodes(nb_nodes), 200);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
y = heaviside(x).*x;
res = kkb_spline(nodes, x, y, x, degree);
plot(x, res, '--b');
hold on

nodes = [-1, 0, 0, 0, 1]
nb_nodes = length(nodes);
x = linspace(nodes(1), nodes(nb_nodes), 200);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
y = heaviside(x).*x;
res = kkb_spline(nodes, x, y, x, degree);
plot(x, res, '-k');
axis([-0.5, 0.5, -0.1, 0.5]);
hold on

