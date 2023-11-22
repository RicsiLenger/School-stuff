function fl2(t, k1, k2)
    % Ellenőrizzük, hogy a bemeneti paraméterek megfelelő formátumúak
    if ~isscalar(t) || ~isscalar(k1) || ~isscalar(k2) || ~isnumeric(t) || ~isnumeric(k1) || ~isnumeric(k2)
        error('A bemeneti paramétereknek skalárnak és numerikusnak kell lenniük.');
    end
    
    if t < 0 || k1 >= k2
        error('Az input paraméterek nem megfelelőek. t pozitív egész, k1 < k2.');
    end
    
    % Inicializáljuk a mátrixokat az eredmények és a gépi számok tárolására
    results = zeros(1, t);
    machine_numbers = zeros(1, t);
    
    for i = 1:t
        % Kiszámítjuk a gépi számot a fl1 függvénnyel
        v = [randi([0, 1], 1, k1) 1 randi([0, 1], 1, k2 - k1 - 1)];
        machine_numbers(i) = fl1(v);
        
        % Számoljuk az eredményeket
        results(i) = machine_numbers(i);
    end
    
    % Kiírjuk az eredményeket és a nevezetes elemeket
    disp('Eredmények:');
    disp(results);
    
    % Kiszámítjuk a nevezetes elemeket
    M_infinity = max(machine_numbers);
    epsilon_0 = min(machine_numbers(machine_numbers > 0));
    epsilon_1 = min(machine_numbers(machine_numbers > epsilon_0));
    
    % Kiírjuk a nevezetes elemeket
    disp(['M∞ = ' num2str(M_infinity)]);
    disp(['ε0 = ' num2str(epsilon_0)]);
    disp(['ε1 = ' num2str(epsilon_1)]);
    
    figure; % Hozzunk létre egy ábrát
    plot(machine_numbers, zeros(size(machine_numbers)), 'o'); % Ábrázoljuk a gépi számokat a valós számegyenesen
    title('Gépi számok a valós számegyenesen');
    xlabel('Gépi számok');
    ylabel('Valós számegyenes');
    grid on; % Hozzunk létre rácsozást az ábrához
end
