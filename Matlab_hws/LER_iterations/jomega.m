function [omega_values, spectral_radii, optimal_omega, convergence_range] = jomega(A)
    n = size(A, 1);
    max_iterations = 1000;
    tolerance = 1e-5;
    
    omega_values = 0:0.01:2;
    spectral_radii = zeros(size(omega_values));
    
    for i = 1:length(omega_values)
        omega = omega_values(i);
        D = diag(diag(A));
        L = tril(A, -1);
        U = triu(A, 1);
        M = (D + omega * L) \ ((1 - omega) * D - omega * U);
        
        eigenvalues = eig(M);
        spectral_radii(i) = max(abs(eigenvalues));
    end
    
    % Spektrálsugár és az optimális ω meghatározása
    [spectral_radius, idx] = min(spectral_radii);
    optimal_omega = omega_values(idx);
    
    % Konvergencia tartomány meghatározása
    convergence_range = find(spectral_radii < 1 + tolerance);
    
    % Ábrázolás
    figure;
    plot(omega_values, spectral_radii, 'b');
    hold on;
    plot(optimal_omega, spectral_radius, 'ro');
    plot([0, 2], [1, 1], 'k--');
    xlabel('\omega');
    ylabel('Sajátértékek abszolútértéke');
    title('Csillapított Jacobi iteráció: \omega paraméter és sajátértékek abszolútértéke');
    legend('Spektrálsugár', 'Optimális \omega', 'Konvergencia tartomány', 'Location', 'best');
    grid on;
    
    % Visszatérési értékek
    disp(['Az optimális \omega értéke: ', num2str(optimal_omega)]);
    disp(['A spektrálsugár értéke: ', num2str(spectral_radius)]);
    disp(['A konvergencia tartomány: [', num2str(omega_values(convergence_range(1))), ', ', num2str(omega_values(convergence_range(end))), ']']);
end
