function x = gaussel2(A, b, partialPivoting)
    % Alapértelmezett érték a részleges főelemkiválasztásra
    if nargin < 3
        partialPivoting = true;
    end

    % Ellenőrizzük, hogy az A mátrix sorai számossága egyenlő b vektor hosszával
    if size(A, 1) ~= length(b)
        error('Az egyenletrendszer nem megfelelő méretű.');
    end

    % Megoldásvektor inicializálása
    x = zeros(size(A, 2), 1);

    % Gauss-elimináció
    n = length(b);
    for k = 1:n
        if partialPivoting
            % Részleges főelemkiválasztás
            [maxVal, maxIdx] = max(abs(A(k:n, k)));
            maxIdx = maxIdx + k - 1;
            if maxVal == 0
                error('A főelemkiválasztás során nulla főelem található. Teljes főelemkiválasztásra váltás.');
                partialPivoting = false;
                [maxVal, maxIdx] = max(abs(A(k:n, k)));
                maxIdx = maxIdx + k - 1;
            end
            A([k, maxIdx], k:n) = A([maxIdx, k], k:n); % Sorcsere
            b([k, maxIdx]) = b([maxIdx, k]); % Vektorcsere
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
