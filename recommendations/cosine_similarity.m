function similarity = cosine_similarity(A, B)
    % Normez vectorii
    norm_A = sqrt(sum(A.^2));
    norm_B = sqrt(sum(B.^2));
    
    % Calculez dot product
    dot_product = sum(A .* B);
    
    % Verificare
    if norm_A > 0 && norm_B > 0
        similarity = dot_product / (norm_A * norm_B);
    else
        similarity = 0;  % Handle zero-vector case
    end
    
    % Verific outputul apartine intervalului [-1, 1]
    similarity = max(-1, min(1, similarity));
end