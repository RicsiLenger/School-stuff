function [Q, R] = hhalg(A)
    [m, n] = size(A);
    
    if m ~= n
        error('A bemenő mátrixnak négyzetesnek kell lennie.');
    end
    
    Q = eye(m);  % Kezdetben az ortogonális mátrix Q egy egységmátrix
    R = A;       % A felső-háromszög mátrix R az A mátrix kópia
    
    for k = 1:n
        x = R(k:m, k);  % Vegyük az aktuális oszlop alatt lévő vektort
        e1 = zeros(size(x));
        e1(1) = 1;  % Az e1 vektor az első szabadsági fok az aktuális vektorban
        
        % Hozzuk létre a Householder-transzformációt a vektorok közötti tükrözéshez
        H = eye(m);
        H(k:m, k:m) = eye(m-k+1) - 2 * (x * x') / (x' * x);
        
        % Frissítsük a R mátrixot a Householder-transzformációval
        R = H * R;
        
        % Frissítsük az ortogonális mátrixot Q a Householder-transzformációval
        Q = Q * H;
    end
end
