% Berekent de kkb met splines
% t: knooppuntenrij
% x: abscissen
% f: bij x horende functiewaarden
% y: punten om de spline in te evalueren
% k: graad van de splines
function results = kkb_spline(t, x, f, y, k)
    n = length(t) - k;
    A = zeros(length(x), n);
    %effective_nodes = t(k:n);
    % rij index 1 in 'A' komt overeen met index -k
    for i = 1:length(x)
        for j = 1:n
            A(i, j) = normal_spline(j, k + 1, t, x(i));
        end
    end
    % index 1 in 'coefficients' komt overeen met index -k.
    % 'coefficients' loopt van -k tot en met n. (= 1 t.e.m. n+k)
    coefficients = A\f'
    results = linspace(0, 0, length(y));
    % Genereer rij van resultaten voor de waarden uit de vector y.
    % TODO: evalueren met algoritme van de Boor.
    for i = 1:length(y)
        for j = 1:length(coefficients)
            results(i) = results(i) + coefficients(j)*normal_spline(j, k + 1, t, y(i));
        end
    end
    