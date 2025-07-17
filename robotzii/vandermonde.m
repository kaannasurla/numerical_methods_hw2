function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]' (column vector)
    % y = [y0, y1, ..., yn]' (column vector)
    % coef = [a0, a1, a2, ..., an]' (polynomial coefficients)
    
    n = length(x);
    A = zeros(n, n);
    
    % 1. Construiesc matricea Vandermonde
    i = 1;
    while i <= n
        j = 1;
        while j <= n
            A(i, j) = x(i) ^ (j - 1);
            j = j + 1;
        end
        i = i + 1;
    end
    
    % 2. Rezolv A*coef = y without
    coef = zeros(n, 1);
    temp_A = A;
    temp_y = y;
    
    % Eliminare GPP (Gaussian Partial Pivoting)
    k = 1;
    while k <= n
        [max_val, pivot] = max(abs(temp_A(k:n, k)));
        pivot = pivot + k - 1;
        
        if pivot ~= k
            temp_A([k pivot], :) = temp_A([pivot k], :);
            temp_y([k pivot]) = temp_y([pivot k]);
        end
        
        % Eliminarea
        m = k + 1;
        while m <= n
            factor = temp_A(m, k) / temp_A(k, k);
            temp_A(m, k:n) = temp_A(m, k:n) - factor * temp_A(k, k:n);
            temp_y(m) = temp_y(m) - factor * temp_y(k);
            m = m + 1;
        end
        k = k + 1;
    end
    
    % Substitutie inversa
    k = n;
    while k >= 1
        coef(k) = (temp_y(k) - temp_A(k, k+1:n) * coef(k+1:n)) / temp_A(k, k);
        k = k - 1;
    end
end