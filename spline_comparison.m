nb_nodes = 10;
degree = 3;
spline_index = 4;
nodes = linspace(0, nb_nodes + 2*degree - 1, nb_nodes + 2*degree);
x = linspace(nodes(degree + 1), nodes(length(nodes) - degree), 100);
% Alle spline coefficiënten op nul behalve één.
coefficients = zeros(3, nb_nodes + degree);
coefficients(1, spline_index + 1) = 1;
coefficients(2, spline_index + 2) = 1;
coefficients(3, spline_index + 3) = 1;
de_Boor_1 = zeros(3, length(x));
splines_1 = zeros(3, length(x));
de_Boor_2 = zeros(3, length(x));
splines_2 = zeros(3, length(x));
de_Boor_3 = zeros(3, length(x));
splines_3 = zeros(3, length(x));

% Vergelijkende plot opstellen
figure
for degree = 1:3
    for j = 1:length(x)
        de_Boor_1(degree, j) = de_Boor_eval(coefficients(1,:), nodes, degree, x(j));
        splines_1(degree, j) = normal_spline(spline_index + 1, degree, nodes, x(j));
        de_Boor_2(degree, j) = de_Boor_eval(coefficients(2,:), nodes, degree, x(j));
        splines_2(degree, j) = normal_spline(spline_index + 2, degree, nodes, x(j));
        de_Boor_3(degree, j) = de_Boor_eval(coefficients(3,:), nodes, degree, x(j));
        splines_3(degree, j) = normal_spline(spline_index + 3, degree, nodes, x(j));
    end
    % Plot splines geëvalueerd volgens recursiebetrekking
    subplot(2, 3, degree)
    axis([3, 10, 0, 1])
    plot(x, splines_1(degree, :), x, splines_2(degree, :), x, splines_3(degree, :))
    title(['Recursief, k=' num2str(degree)]);
    % Plot splines geëvalueerd volgens algoritme van de Boor
    subplot(2, 3, 3 +degree)
    axis([3, 10, 0, 1])
    plot(x, de_Boor_1(degree, :), x, de_Boor_2(degree, :), x, de_Boor_3(degree, :))
    title(['de Boor, k=' num2str(degree)]);
end