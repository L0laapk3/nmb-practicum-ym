% Evalueert de genormaliseerde B-spline met de gegeven index, voor de
% gegeven knooppuntenrij `nodes` en met orde `order` in het punt x 
% volgens de recursiebetrekking voor splines.
function value = normal_spline(index, order, nodes, x)
    % order == 1 komt overeen met graad == 0
    if order == 1
        if (nodes(index) <= x) && (x < nodes(index + 1))
            value = 1;
        else
            value = 0;
        end
        return
    end
    value = (x - nodes(index))/(nodes(index + order - 1) - nodes(index))*normal_spline(index, order - 1, nodes, x);
    if (index + order) <= length(nodes)
        value = value + (nodes(index + order) - x)/(nodes(index + order) - nodes(index + 1))*normal_spline(index + 1, order - 1, nodes, x);
    end