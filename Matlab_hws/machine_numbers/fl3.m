function result = fl3(varargin)
    if nargin > 1
        error('Több bemenő paramétert nem támogat.');
    end

    % Alapértelmezett gépi számhalmaz definíciója
    machine_min = realmin; % Minimális normalizált érték
    machine_max = realmax; % Maximális normalizált érték
    
    % Bemenő paraméterek ellenőrzése és feldolgozása
    if nargin == 1
        x = varargin{1};
        if x < machine_min || x > machine_max
            error('A megadott szám nincs a megengedett tartományban.');
        end
    else
        % Ha nincs bemenő paraméter, az alapértelmezett gépi számot használjuk
        x = 2.0; % Például M(8, -5,5)-ön
    end

    % Számítás a mantissza és karakterisztika alapján
    mantissa = 0;
    characteristic = 0;
    if x == 0
        result = [0, mantissa, characteristic];
        return;
    end

    x_abs = abs(x);
    while x_abs >= 2
        x_abs = x_abs / 2;
        characteristic = characteristic + 1;
    end
    mantissa = x_abs - 1;

    % Az előjeles mantissza bit beállítása
    if x < 0
        mantissa_bit = 1;
    else
        mantissa_bit = 0;
    end

    % Visszatérési érték létrehozása
    result = [mantissa_bit, mantissa, characteristic];
    disp(result);
end

