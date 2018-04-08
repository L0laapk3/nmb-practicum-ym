function z = kkb_spline(t, x, f, y, k)
    n = length(t) - k;
    % Matrix opstellen
    A = zeros(length(x), n);
    for i = 1:length(x)
        for j = 1:n-1
            A(i, j) = normal_spline(j, k, t, x(i));
        end
    end
    % Stelsel oplossen
    coefficients = A\f';
    % Resultaten berekenen
    z = zeros(1, length(y));
    for i = 1:length(y)
        z(i) = de_Boor_eval(coefficients, t, k, y(i));
    end
    