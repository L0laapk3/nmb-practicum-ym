x = linspace(0, 10, 200);
y = sin(x);
nb_nodes = 10;
degree = 3;
nodes = linspace(0, 10, nb_nodes + 2*degree);
res = kkb_spline(nodes, x, y, x, degree);
%N = linspace(0, 0, length(x));
% for i = 1:length(x)
%     for j = 1:length(res)
%         N(i) = N(i) + res(j)*normal_spline(j, degree + 1, nodes, x(i));
%     end
% end
%plot(x, res, x, y);

x = linspace(nodes(degree + 1), nodes(degree + 2), 100);
c = linspace(0, 0, length(x));
N = c;
res = linspace(0, 0, length(res));
res(degree + 1) = 1;
for i = 1:length(c)
    c(i) = de_Boor_c(res, nodes, degree, degree, degree + 1, x(i))
    N(i) = normal_spline(degree + 1, degree + 1, nodes, x(i));
end
plot(x, c - N);
