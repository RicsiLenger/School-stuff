function x = gaussel1(A, b)
    % Ellenőrizzük, hogy az A mátrix sorai számossága egyenlő a b vektor hosszával
    if size(A, 1) ~= length(b)
        error('Az egyenletrendszer nem megfelelő méretű.');
    end

    % Megoldásvektor inicializálása
    x = zeros(size(A, 2), 1);

    % Gauss-elimináció
    n = length(b);
    for k = 1:n
        % Sor- és oszlopcsere kezelése
        if A(k, k) == 0
            error('A sor- és oszlopcsere nélküli Gauss-elimináció nem lehetséges.');
        end

        % Eliminációs lépés
        for i = k+1:n
            factor = A(i, k) / A(k, k);
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
            b(i) = b(i) - factor * b(k);
        end
    end

    % Visszaszubstitúció
    x(n) = b(n) / A(n, n);
    for k = n-1:-1:1
        x(k) = (b(k) - A(k, k+1:n) * x(k+1:n)) / A(k, k);
    end
end
