nb_nodes = 10;
degree = 3;
spline_index = 4;
nodes = linspace(0, 10, nb_nodes + 2*degree);
x = linspace(nodes(degree + 1), nodes(length(nodes) - degree), 100);
% Alle spline coefficiënten op nul behalve één.
coefficients = zeros(1, nb_nodes + degree);
coefficients(spline_index) = 1;
de_Boor = zeros(3, length(x));
splines = zeros(3, length(x));

% Vergelijkende plot opstellen
figure
for degree = 1:3
    for j = 1:length(x)
        de_Boor(degree, j) = de_Boor_eval(coefficients, nodes, degree, x(j));
        splines(degree, j) = normal_spline(spline_index, degree + 1, nodes, x(j));
    end
    % Plot splines geëvalueerd volgens recursiebetrekking
    subplot(2, 3, degree)
    plot(x, splines(degree, :))
    title(['Recursief, k=' num2str(degree)]);
    % Plot splines geëvalueerd volgens algoritme van de Boor
    subplot(2, 3, 3 +degree)
    plot(x, de_Boor(degree, :))
    title(['de Boor, k=' num2str(degree)]);
end