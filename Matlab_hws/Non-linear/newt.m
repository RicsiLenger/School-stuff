function x = newt(f, x0, n)
    % Bemenő paraméterek:
    % f - a függvény, karakterlánc formában
    % x0 - a kezdeti érték
    % n - lépésszám

    syms x; % Definiáljuk a szimbolikus változót
    f_sym = str2sym(f);

    % Newton-módszer alkalmazása
    for k = 1:n
        % Függvény és derivált számítása a jelenlegi értéknél
        fk = subs(f_sym, x, x0);
        dfk = subs(diff(f_sym, x), x, x0);

        % Új érték kiszámolása a Newton-módszer képletével
        x0 = x0 - fk / dfk;

        % Ha a változás kicsi, vagy a gyök már közelítődik, akkor kilépünk
        if abs(fk) < eps
            x = x0;
            fprintf('A gyök közelítése: x* = %f\n', x);
            return;
        end
    end

    % Ha a megadott lépésszám után sem találtunk megfelelő közelítést
    error('Nem sikerült megfelelő közelítést találni a megadott lépésszám alatt.');
end
