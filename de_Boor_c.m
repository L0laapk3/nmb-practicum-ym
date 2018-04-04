function val = de_Boor_c(coefficients, nodes, k, r, index, x)
    val = 0;
    if r == 0
        val = coefficients(index);
    else
        alfa = (x - nodes(index))/(nodes(index + k + 1 - r) - nodes(index));
        val = alfa*de_Boor_c(coefficients, nodes, k, r - 1, index, x);
        val = val + (1 - alfa)*de_Boor_c(coefficients, nodes, k, r - 1, index - 1, x);
    end