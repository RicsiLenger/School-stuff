function Aplus = geninv(A)
    % Ellenőrzés, hogy a bemeneti mátrix négyzetes-e
    [m, n] = size(A);
    if m ~= n
        error('Az input mátrixnak négyzetesnek kell lennie.');
    end
    
    % Rangfaktorizáció
    [U, S, V] = svd(A);
    
    % Szűkítés a nemnulla szinguláris értékekre
    tol = eps * max(m, n) * max(diag(S));
    r = sum(diag(S) > tol);
    
    % Általánosított inverz számolása
    Splus = diag([diag(S(1:r, 1:r)).^(-1); zeros(m-r, 1)]);
    Aplus = V * Splus * U';
end
