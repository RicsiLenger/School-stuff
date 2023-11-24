function lagrangeip(x, y)
    % Lagrange-interpoláció M-file

    % Ellenőrizze, hogy az alappontok és a függvényértékek azonos hosszúságúak-e
    if length(x) ~= length(y)
        error('Az alappontok és a függvényértékek hossza nem egyezik meg.');
    end

    n = length(x); % Az alappontok száma
    lagrange_polynomial = zeros(size(x)); % Inicializjuk az interpolációs polinomot

    % Számolja ki a Lagrange szorzókat és adjuk hozzá a polinomhoz
    for i = 1:n
        term = y(i);
        for j = 1:n
            if j ~= i
                term = conv(term, poly(x(j))) / (x(i) - x(j)); % Polinom szorzás
            end
        end
        lagrange_polynomial = lagrange_polynomial + term;
    end

    % Rajzoljunk grafikont
    figure;
    plot(x, y, 'o', 'MarkerFaceColor', 'b'); % Az alappontok megjelenítése kék körökkel
    hold on;
    fplot(@(x) polyval(lagrange_polynomial, x), [min(x), max(x)], 'r'); % Az interpolációs polinom ábrázolása piros vonallal
    title('Lagrange-interpoláció');
    xlabel('X tengely');
    ylabel('Y tengely');
    legend('Alappontok', 'Interpolációs polinom');
    grid on;
    hold off;
end
