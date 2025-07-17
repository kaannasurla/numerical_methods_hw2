function coef = spline_c2(x, y)
    % x = [x0, x1, ..., xn]' (strictly increasing)
    % y = [y0, y1, ..., yn]'
    % coef = [a0, b0, c0, d0, a1, b1, ..., dn-1]' (4n coefficients)
    
    n = length(x) - 1;
    N = 4 * n;
    A = sparse(N, N);
    b = zeros(N, 1);
    
    h = diff(x);
    
    % Functiile de baza:
    for i = 1:n
        A(i, 4*(i-1)+1) = 1;  % ai coefficient
        b(i) = y(i);
    end
    
    % Valorile de baza:
    A(n+1, 4*n-3) = 1;        % an
    A(n+1, 4*n-2) = h(n);     % bn
    A(n+1, 4*n-1) = h(n)^2;   % cn
    A(n+1, 4*n) = h(n)^3;     % dn
    b(n+1) = y(n+1);
    
    % Intre splinele:
    for i = 1:n-1
        row = n + 1 + i;
        A(row, 4*(i-1)+1) = 1;       % ai
        A(row, 4*(i-1)+2) = h(i);     % bi
        A(row, 4*(i-1)+3) = h(i)^2;   % ci
        A(row, 4*(i-1)+4) = h(i)^3;   % di
        A(row, 4*i+1) = -1;            % -ai+1
    end
    
    % Prima derivata
    for i = 1:n-1
        row = 2*n + i;
        A(row, 4*(i-1)+2) = 1;        % bi
        A(row, 4*(i-1)+3) = 2*h(i);   % ci
        A(row, 4*(i-1)+4) = 3*h(i)^2; % di
        A(row, 4*i+2) = -1;           % -bi+1
    end
    
    % A doua derivata
    for i = 1:n-1
        row = 3*n - 1 + i;
        A(row, 4*(i-1)+3) = 2;        % ci
        A(row, 4*(i-1)+4) = 6*h(i);   % di
        A(row, 4*i+3) = -2;           % -ci+1
    end
    
    % Conditii de margine:
    A(4*n-1, 3) = 2;                  % c1
    A(4*n, 4*n-1) = 2;                % cn
    A(4*n, 4*n) = 6*h(n);             % dn
    
    % Solutia sistemului
    coef = A \ b;
end