function H = householder(P, P0)
    % Ellenőrizzük a bemeneti méreteket
    if size(P, 1) ~= size(P0, 1)
        error('A pontok dimenziója nem egyezik meg.');
    end

    % Kiszámítjuk a Householder-transzformáció paraméterét (σ)
    v = P0 - P;
    sigma = 2 / (v' * v);

    % Az egységvektor létrehozása
    u = v / norm(v);

    % Householder-transzformáció mátrix kiszámítása
    H = eye(size(P, 1)) - sigma * (u * u');

    % Ügyeljünk a σ paraméter előjelére
    if sigma < 0
        H = -H;
    end
end
