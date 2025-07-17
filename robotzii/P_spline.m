function y_interp = P_spline(coef, x, x_interp)
    % si(x) = ai + bi(x-xi) + ci(x-xi)^2 + di(x-xi)^3, i = 0:n-1
    % coef = [a0,b0,c0,d0, a1,b1,c1,d1, ..., an-1,bn-1,cn-1,dn-1]
    % x = [x0,x1,...,xn] (sorted)
    % y_interp(i) = P_spline(x_interp(i)), i = 1:length(x_interp)
    
    m = length(x_interp);
    n = length(x) - 1;
    y_interp = zeros(m, 1);
    
    i = 1;
    while i <= m
        % Cauta intervalul in care se afla x_interp(i)
        left = 1;
        right = n + 1;
        found = false;
        
        while left <= right && ~found
            mid = floor((left + right)/2);
            if x_interp(i) < x(mid)
                right = mid - 1;
            elseif x_interp(i) > x(mid)
                left = mid + 1;
            else
                left = mid + 1;
                found = true;
            end
        end
        
        % Intervalul in care se afla x_interp(i) este [j, j+1]
        j = left - 1;
        if j == n + 1
            j = j - 1;
        end
        
        temp = x_interp(i) - x(j);
        
        idx = 4*(j-1);
        aj = coef(idx + 1);
        bj = coef(idx + 2);
        cj = coef(idx + 3);
        dj = coef(idx + 4);
        
        % Schema lui Horner pentru calcularea polinomului
        y_interp(i) = aj + temp*(bj + temp*(cj + temp*dj));
        
        i = i + 1;
    end
end