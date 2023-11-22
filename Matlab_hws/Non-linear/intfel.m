function x = intfel(f, a, b, n, eps)
    % Bemenő paraméterek:
    % f - a függvény, karakterlánc formában
    % a, b - kezdeti intervallum végpontjai
    % n - lépésszám
    % epsilon - pontossági elvárás

    % Ellenőrzés, hogy az intervallum megfelelő-e
    if feval(f, a) * feval(f, b) > 0
        error('Az intervallum nem megfelelő! Az intervallumnak tartalmaznia kell a gyököt.');
    end

    % Ha csak az egyik végpontot adták meg, kérjük be a másikat
    if a > b
        temp = a;
        a = b;
        b = temp;
    elseif a == b
        error('Az intervallum hossza 0. Kérem, adjon meg különböző végpontokat.');
    end

    % Intervallumfelezés
    for k = 1:n
        fa = feval(f, a);
        fb = feval(f, b);
        c = (a + b) / 2; % Intervallum felezése
        fc = feval(f, c);

        % Hibabecslés
        if abs(fc) < eps
            x = c;
            fprintf('A gyök közelítése: x* = %f\n', x);
            return;
        end

        % Új intervallum kiválasztása
        if fc * fa < 0
            b = c;
        else
            a = c;
        end
    end

    % Ha a megadott lépésszám után sem találtunk megfelelő közelítést
    error('Nem sikerült megfelelő közelítést találni a megadott lépésszám alatt.');
end
