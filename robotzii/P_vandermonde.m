function y_interp = P_vandermonde(coef, x_interp)
    % P_vandermonde(x) = a0 + a1*x + a2*x^2 + ... + an*x^n
    % coef = [a0, a1, a2, ..., an]' (column vector)
    % y_interp(i) = P_vandermonde(x_interp(i)), i = 1:length(x_interp)
    
    n = length(coef);
    x_interp = x_interp(:);
    
    % Initializare cu coef(n) pentru a0
    y_interp = coef(n) * ones(size(x_interp));
    
    % Folosesc schema lui Horner pentru a calcula polinomul
    for k = n-1:-1:1
        y_interp = y_interp .* x_interp + coef(k);
    end
end