function x = jacobi(A, b)
    % Ellenőrzés, hogy A szimmetrikus diagonálisan domináns mátrix-e
    n = size(A, 1);
    for i = 1:n
        if 2 * abs(A(i, i)) <= sum(abs(A(i, :)))
            error('A mátrix nem diagonálisan domináns. A Jacobi-iteráció nem alkalmazható.');
        end
    end

    x = zeros(n, 1); % Kezdeti megoldásvektor
    maxIterations = 1000; % Maximális iterációs lépések száma
    tolerance = 1e-5; % Tolerancia az iteráció leállításához

    for k = 1:maxIterations
        x_old = x;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma + A(i, j) * x_old(j);
                end
            end
            x(i) = (b(i) - sigma) / A(i, i);
        end

        % Ellenőrizzük, hogy elértük-e a megfelelő pontosságot
        if norm(x - x_old) < tolerance
            break;
        end
    end

    if k == maxIterations
        warning('A maximális iterációs lépésszámot elértük. A megoldás közelítő.');
    end
end
