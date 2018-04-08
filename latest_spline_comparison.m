nb_nodes = 10;
degree = 3;
spline_index = 3;
nodes = linspace(0, nb_nodes + 2*degree - 1, nb_nodes + 2*degree);
x = linspace(nodes(degree + 1), nodes(length(nodes) - degree), 100);
% Alle spline coefficiënten op nul behalve één.
coefficients = zeros(3, nb_nodes + degree);
coefficients(1, spline_index + 1) = 1;
coefficients(2, spline_index + 2) = 1;
coefficients(3, spline_index + 3) = 1;
de_Boor = zeros(length(x), 3, 3);
splines = zeros(length(x), 3, 3);
plotlist = zeros(1, 6);
% Create figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);
for degree = 1:3
    for index =1:3
        for j = 1:length(x)
            de_Boor(j, degree, index) = de_Boor_eval(coefficients(index,:), nodes, degree, x(j));
            splines(j, degree, index) = normal_spline(spline_index + index, degree, nodes, x(j));
        end
    end
    % Subplots maken voor de recursief geëvalueerde splines
    plotlist(degree) = subplot(2,3,degree,'Parent',figure1);
    hold(plotlist(degree),'on');
    plot(x, splines(:, degree, 1), 'Parent', plotlist(degree));
    plot(x, splines(:, degree, 2), 'Parent', plotlist(degree));
    plot(x, splines(:, degree, 3), 'Parent', plotlist(degree));
    % Create title
    title(['Recursief, k=', num2str(degree)],'FontSize',11);
    box(plotlist(degree),'on');
    % Set the remaining axes properties
    xlim(plotlist(degree),[3 10]);
    ylim(plotlist(degree),[0 1]);
    box(plotlist(degree),'on');
    set(plotlist(degree),'XTick',[3 4 5 6 7 8 9 10]);
    % Subplots maken voor de splines geëvalueerd met de Boor
    plotlist(degree + 3) = subplot(2,3,degree + 3,'Parent',figure1);
    hold(plotlist(degree + 3),'on');
    plot(x, de_Boor(:, degree, 1), 'Parent', plotlist(degree + 3));
    plot(x, de_Boor(:, degree, 2), 'Parent', plotlist(degree + 3));
    plot(x, de_Boor(:, degree, 3), 'Parent', plotlist(degree + 3));
    % Create title
    title(['de Boor, k=', num2str(degree)],'FontSize',11);
    box(plotlist(degree + 3),'on');
    % Set the remaining axes properties
    xlim(plotlist(degree + 3),[3 10]);
    ylim(plotlist(degree + 3),[0 1]);
    box(plotlist(degree + 3),'on');
    set(plotlist(degree + 3),'XTick',[3 4 5 6 7 8 9 10]);
end