x = linspace(-1,1,200);
f = sin(20*x)./(100*x.^2+5);
f_ruis = f + 0.04*randn(size(x));
degree = 3;

figure(1)
% Foutencurve plotten
node_list = linspace(2, 100);
f_results = node_list;
ruis_results = node_list;
for i = 1:length(node_list)
    nodes = linspace(-1, 1, node_list(i));
    nb_nodes = length(nodes);
    left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
    right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
    nodes = [left, nodes, right];
    z = kkb_spline(nodes, x, f_ruis, x, degree);
    f_results(i) = norm(f'-z');
    ruis_results(i) = norm(f_ruis'-z');
end
plot(node_list, f_results, '*r');
hold on
plot(node_list, ruis_results, 'ob');
title('Fout in functie van aantal knooppunten');
xlabel('Aantal knooppunten');
legend('norm(f\_ruis-z)', 'norm(f-z)');

[val, best_f_index] = min(f_results)
[val, best_f_ruis_index] = min(ruis_results)

% Beste benaderingen plotten
figure(2)

% beste f
subplot(1, 2, 1)
nodes = linspace(-1, 1, best_f_index);
nb_nodes = length(nodes);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
z = kkb_spline(nodes, x, f_ruis, x, degree);
plot(x, f, 'r');
hold on
plot(x, z, 'b');
title(['Beste benadering van f met ', num2str(best_f_index), ' knooppunten']);
legend('f', 'benadering');

subplot(1, 2, 2)
nodes = linspace(-1, 1, best_f_ruis_index);
nb_nodes = length(nodes);
left = linspace(nodes(1) - (nodes(2)-nodes(1))*degree, nodes(1) - (nodes(2)-nodes(1)), degree);
right = linspace(nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1)), nodes(nb_nodes) + (nodes(nb_nodes)-nodes(nb_nodes-1))*degree, degree);
nodes = [left, nodes, right];
z = kkb_spline(nodes, x, f_ruis, x, degree);
plot(x, f, 'r');
hold on
plot(x, z, 'b');
title(['Beste benadering van f\_ruis met ', num2str(best_f_ruis_index), ' knooppunten']);
legend('f', 'benadering');



