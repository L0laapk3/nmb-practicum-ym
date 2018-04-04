% Evalueert de genormaliseerde B-spline met de gegeven index, voor de
% gegeven knooppuntenrij `nodes` en met orde `order` in het punt x 
% volgens de recursiebetrekking voor splines.
function value = normal_spline(index, degree, nodes, x)
    if degree == 0
        if (nodes(index) <= x) && (x < nodes(index + 1))
            value = 1;
        else
            value = 0;
        end
        return
    end
    value = (x - nodes(index))/(nodes(index + degree) - nodes(index))*normal_spline(index, degree - 1, nodes, x);
    if (index + degree + 1) <= length(nodes)
        value = value + (nodes(index + degree + 1) - x)/(nodes(index + degree + 1) - nodes(index + 1))*normal_spline(index + 1, degree - 1, nodes, x);
    end