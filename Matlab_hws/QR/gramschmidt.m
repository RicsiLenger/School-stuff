function [Q, R] = gramschmidt(A)
    [m, n] = size(A);
    
    if m ~= n
        error('A bemenő mátrixnak négyzetesnek kell lennie.');
    end
    
    Q = zeros(m, n);
    R = zeros(n, n);
    
    for j = 1:n
        v = A(:, j);
        for i = 1:j-1
            R(i, j) = Q(:, i)' * A(:, j);
            v = v - R(i, j) * Q(:, i);
        end
        R(j, j) = norm(v);
        if R(j, j) < 1e-10
            error('A mátrix oszlopai nem lineárisan függetlenek.');
        end
        Q(:, j) = v / R(j, j);
    end
end
