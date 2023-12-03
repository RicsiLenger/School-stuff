function coefficients = lnmaprox(degree, nodes)
    % Ellenőrzés, hogy a csomópontok száma legalább a polinom fokszámának + 1
    if length(nodes) < degree + 1
        error('Not enough nodes for the given degree of the polynomial.');
    end

    % A csomópontok számának meghatározása
    n = length(nodes);

    % X mátrix létrehozása
    X = zeros(n, degree + 1);
    for i = 1:n
        for j = 1:degree + 1
            X(i, j) = nodes(i)^(degree + 1 - j);
        end
    end

    % Y mátrix létrehozása
    Y = log(nodes)';  % Az ln függvény alkalmazása a csomópontokra

    % Az egyenletrendszer megoldása
    coefficients = linsolve(X' * X, X' * Y);

    % Grafikus ábrázolás, ha a felhasználó azt kéri
    prompt = 'Kívánja ábrázolni az approximációt? (igen/nem): ';
    answer = input(prompt, 's');

    if strcmpi(answer, 'igen')
        plot(nodes, Y, 'o', 'DisplayName', 'Csomópontok');
        hold on;

        % Az approximációs polinom értékeinek számítása
        x_values = linspace(min(nodes), max(nodes), 100);
        y_values = polyval(flip(coefficients), x_values);

        plot(x_values, y_values, 'r-', 'DisplayName', 'Approximációs polinom');
        legend('show');
        title('Legkisebb négyzetek módszerével történő approximáció');
        xlabel('X tengely');
        ylabel('Y tengely');
        grid on;
        hold off;
    end
end
