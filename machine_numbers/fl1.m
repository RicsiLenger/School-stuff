function result = fl1(v)
    % Ellenőrizzük, hogy a bemeneti vektor megfelel-e a követelményeknek
    if ~isvector(v) || length(v) < 2
        error('A bemeneti vektornak legalább két elemet kell tartalmaznia.');
    end
    
    mantissa = v(1:end-1); % Mantissza: az utolsó elem nélkül
    characteristic = v(end); % Karakterisztika: az utolsó elem
    
    % Ellenőrizzük, hogy a mantissza elemei csak 0 vagy 1 lehetnek
    if any(mantissa ~= 0 & mantissa ~= 1)
        error('A mantissza elemei csak 0 vagy 1 lehetnek.');
    end
    
    % Ellenőrizzük, hogy a karakterisztika értéke megengedett legyen
    if characteristic ~= 0 && characteristic ~= 1
        error('A karakterisztika csak 0 vagy 1 lehet.');
    end
    
    % Kiszámítjuk a gépiszámot
    sign_bit = characteristic; % Az előjelbit a karakterisztikából veszi
    mantissa_value = bin2dec(num2str(mantissa)); % Átszámítjuk a mantisszát decimális értékké
    result = (-1)^sign_bit * mantissa_value; % Kiszámítjuk a gépiszámot
end
