function [invA, detA] = gaussel3(A)
    % Ellenőrizzük, hogy az A egy négyzetes mátrix
    [m, n] = size(A);
    if m ~= n
        error('Az input mátrix nem négyzetes.');
    end

    % Az inverz és determináns számítása
    n = length(A);
    I = eye(n); % Egységmátrix létrehozása

    invA = zeros(n);
    detA = 1;

    for k = 1:n
        % Eliminációs lépés
        for i = k+1:n
            factor = A(i, k) / A(k, k);
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
            I(i, k:n) = I(i, k:n) - factor * I(k, k:n);
        end
        detA = detA * A(k, k); % Determináns kiszámítása

        % Visszaszubstitúció
        for i = k-1:-1:1
            factor = A(i, k) / A(k, k);
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
            I(i, k:n) = I(i, k:n) - factor * I(k, k:n);
        end
    end

    % Inverz kiszámítása
    for k = 1:n
        invA(k, :) = I(k, :) / A(k, k);
    end
end
