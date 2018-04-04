% Evalueert een splinefunctie s(x) van graad `degree` met als coefficienten
% `spline_coefficients` en als knooppunten `nodes`. De rij index 1 van de
% vetoren met knooppunten en coefficienten komt overeen met de index -k.
function f = de_Boor_eval(coefficients, nodes, degree, x)
    f = 0;
    for index = 1:length(nodes)-1
        if ((x >= nodes(index)) && (x < nodes(index + 1)))
            f = de_Boor_c(coefficients, nodes, degree, degree, index, x);
        end
    end
