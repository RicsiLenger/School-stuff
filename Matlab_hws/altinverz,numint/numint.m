function result = numint(integrand, a, b, n, method)
    % Ellenőrzés, hogy az integrand egy függvény vagy string-e
    if isa(integrand, 'function_handle')
        f = integrand;
    elseif ischar(integrand)
        f = str2func(['@(x)' integrand]);
    else
        error('Az integrand paraméternek függvény vagy string kell lennie.');
    end

    % Köztes pontok generálása
    x = linspace(a, b, n+1);

    % Klasszikus kvadratúra formulák
    switch lower(method)
        case 'teglalap'
            h = (b - a) / n;
            result = h * sum(f(x(1:end-1)));
        case 'trapez'
            h = (b - a) / n;
            result = h * (sum(f(x)) - 0.5 * (f(a) + f(b)));
        case 'simpson'
            h = (b - a) / n;
            x_odd = x(2:2:end-1);
            x_even = x(3:2:end-2);
            result = (h / 3) * (f(a) + 4 * sum(f(x_odd)) + 2 * sum(f(x_even)) + f(b));
        otherwise
            error('Ismeretlen kvadratúra formula típus: %s', method);
    end
end
