function value = normal_spline(index, degree, nodes, x)
    results = zeros(degree + 1, degree + 1);
    for i = 0:degree
        if (nodes(index + i) <= x) && (x < nodes(index + i + 1))
            results(i + 1, 1) = 1;
        end
    end
    for k = 1:degree
        for i = 1:degree+1-k
            c_1 = (x-nodes(index + i - 1))/(nodes(index + i - 1 + k) - nodes(index + i - 1));
            if isfinite(c_1)
                results(i, k + 1) = results(i, k + 1) + c_1*results(i, k);
            end
            c_2 = (nodes(index + i + k) - x)/(nodes(index + i + k) - nodes(index + i));
            if isfinite(c_2)
                results(i, k + 1) = results(i, k + 1) + c_2*results(i + 1, k);
            end
        end
    end
    value = results(1, degree + 1);