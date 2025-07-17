function reduced_mat = preprocess(mat, min_reviews)
    % Counter numere nenule
    review_counts = sum(mat ~= 0, 2);
    
    % Identific randurile care trebuie pastrate (folosesc vectorizare)
    keep_rows = review_counts >= min_reviews;
    
    % Filtrarea matricei
    reduced_mat = mat(keep_rows, :);
end