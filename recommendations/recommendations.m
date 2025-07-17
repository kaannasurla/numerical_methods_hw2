function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
    % Get the best num_recoms recommendations similar to liked_theme
    mat = read_mat(path);
    mat = preprocess(mat, min_reviews);

    % Calculez SVD redus
    [~, ~, V] = svds(mat, num_features);
    
    n = size(V, 1);
    similarities = zeros(n, 1);
    
    % Calculez similaritatea cosinus
    i = 1;
    while i <= n
        % Iau vectorii
        v1 = V(liked_theme, :)';
        v2 = V(i, :)';
        
        % Calculez similaritatea cosinus
        dot_product = 0;
        norm_v1 = 0;
        norm_v2 = 0;
        j = 1;
        while j <= num_features
            dot_product = dot_product + v1(j) * v2(j);
            norm_v1 = norm_v1 + v1(j)^2;
            norm_v2 = norm_v2 + v2(j)^2;
            j = j + 1;
        end
        similarities(i) = dot_product / (sqrt(norm_v1) * sqrt(norm_v2));
        
        i = i + 1;
    end
    
    % Sortez similaritatile in ordine descrescatoare
    indices = (1:n)';
    k = 1;
    while k <= n-1
        m = n;
        while m > k
            if similarities(m) > similarities(m-1)
                temp_sim = similarities(m);
                similarities(m) = similarities(m-1);
                similarities(m-1) = temp_sim;               
                temp_idx = indices(m);
                indices(m) = indices(m-1);
                indices(m-1) = temp_idx;
            end
            m = m - 1;
        end
        k = k + 1;
    end
    
    % Extrag primele num_recoms recomandari
    recoms = zeros(num_recoms, 1);
    count = 0;
    pos = 2;
    
    while count < num_recoms && pos <= n
        recoms(count+1) = indices(pos);
        count = count + 1;
        pos = pos + 1;
    end
    
    recoms = recoms';
end