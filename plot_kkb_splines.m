nb_nodes = 30;
degree = 3;
interval = [-3, 3];
nodes = linspace(interval(1), interval(2), nb_nodes + 2*degree);
x = linspace(interval(1), interval(2), 200);
f = zeros(1, length(x));
for i = 1:length(x)
    f(i) = sin(20.*x(i))/(100*x(i).^2 + 5);
end
res = kkb_spline(nodes, x, f, x, degree);
plot(x, f, x, res);
