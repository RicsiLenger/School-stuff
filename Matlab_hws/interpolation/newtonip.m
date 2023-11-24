function newton_polynomial = newtonip(x, y)

    % Ellenőrizze, hogy az alappontok és a függvényértékek azonos hosszúságúak-e
    if length(x) ~= length(y)
        error('Az alappontok és a függvényértékek hossza nem egyezik meg.');
    end

    n = length(x); % Az alappontok száma
    diff_table = zeros(n, n); % Táblázat az előre számolt differenciákat tárolja

    % Töltse ki az első oszlopot a függvényértékekkel
    diff_table(:, 1) = y';

    % Számolja ki az előre számolt differenciákat
    for j = 2:n
        for i = j:n
            diff_table(i, j) = (diff_table(i, j-1) - diff_table(i-1, j-1)) / (x(i) - x(i-j+1));
        end
    end

    % Az interpolációs polinom Newton alakja
    syms t;
    newton_polynomial = diff_table(1, 1);
    for j = 2:n
        term = 1;
        for i = 1:j-1
            term = term * (t - x(i));
        end
        newton_polynomial = newton_polynomial + diff_table(j, j) * term;
    end

    % Rajzoljunk grafikont
    figure;
    fplot(x, y, 'o', 'MarkerFaceColor', 'b'); % Az alappontok megjelenítése kék körökkel
    hold on;
    plot(newton_polynomial, [min(x), max(x)], 'r'); % Az interpolációs polinom ábrázolása piros vonallal
    title('Newton-interpoláció');
    xlabel('X tengely');
    ylabel('Y tengely');
    legend('Alappontok', 'Interpolációs polinom');
    grid on;
    hold off;

    % Kérdezze meg a felhasználót, hogy szeretne-e új alappontot hozzáadni
    prompt = 'Szeretne új alappontot hozzáadni? (igen/nem): ';
    response = input(prompt, 's');

    if strcmpi(response, 'igen')
        % Kérje be az új alappontot és függvényértéket
        new_x = input('Adja meg az új alappont x értékét: ');
        new_y = input('Adja meg az új alapponthoz tartozó függvényértéket: ');

        % Adja hozzá az új alappontot a mátrixhoz
        x = [x, new_x];
        y = [y, new_y];

        % Rekurzívan hívja meg a függvényt az új adatokkal
        newtonip(x, y);
    end
end

