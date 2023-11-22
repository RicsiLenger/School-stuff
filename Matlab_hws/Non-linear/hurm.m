function x = hurm(f, a, b, n)
    % Bemenő paraméterek:
    % f - a függvény, karakterlánc formában
    % a, b - kezdeti intervallum végpontjai
    % n - lépésszám

    % Ellenőrzés, hogy az intervallum megfelelő-e
    if feval(f, a) * feval(f, b) > 0
        error('Az intervallum nem megfelelő! Az intervallumnak tartalmaznia kell a gyököt.');
    end

    % Húrmódszer alkalmazása
    for k = 1:n
        fa = feval(f, a);
        fb = feval(f, b);
        
        % Húr kiszámolása
        x = (a * fb - b * fa) / (fb - fa);
        fx = feval(f, x);

        % Ellenőrzés, hogy a gyök az intervallumban van-e
        if fx * fa < 0
            b = x;
        elseif fx * fb < 0
            a = x;
        else
            % Ha a gyök az intervallumban van, vagy a húr módszer konvergál, akkor visszaadjuk a gyököt
            x = x;
            fprintf('A gyök közelítése: x* = %f\n', x);
            
            % Grafikus ábrázolás
            figure;
            hold on;
            x_vals = linspace(a, b, 1000);
            plot(x_vals, feval(f, x_vals), 'LineWidth', 2, 'DisplayName', 'Függvény');
            plot(x, feval(f, x), 'ro', 'MarkerSize', 10, 'DisplayName', 'Közelített gyök');
            legend('show');
            title('Zérushely keresés húrmódszerrel');
            xlabel('x');
            ylabel('f(x)');
            grid on;
            hold off;

            return;
        end
    end

    % Ha a megadott lépésszám után sem találtunk megfelelő közelítést
    error('Nem sikerült megfelelő közelítést találni a megadott lépésszám alatt.');
end
