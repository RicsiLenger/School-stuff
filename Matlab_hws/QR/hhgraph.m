function hhgraph()
    % Grafikus adatbekérés
    figure;
    title('Adjon meg egy pontot és annak képét');
    axis([-10 10 -10 10]);
    grid on;
    hold on;

    % Bemenő pont kiválasztása
    [x1, y1] = ginput(1);
    plot(x1, y1, 'ro', 'MarkerSize', 8);

    % Bemenő pont képének kiválasztása
    [x2, y2] = ginput(1);
    plot(x2, y2, 'bo', 'MarkerSize', 8);

    % Householder-transzformáció meghívása
    P = [x1; y1];
    P0 = [x2; y2];
    H = householder(P, P0);

    % Hipersík és tükrözött pont kirajzolása
    xlim = get(gca, 'XLim');
    ylim = get(gca, 'YLim');
    [X, Y] = meshgrid(linspace(xlim(1), xlim(2), 100), linspace(ylim(1), ylim(2), 100));
    Z = H * [X(:)'; Y(:)'];

    % Kirajzoljuk a hipersíkot
    contour(X, Y, reshape(Z(1, :), size(X)), [0 0], 'r');

    % Kirajzoljuk a tükrözött pontot
    P_mirror = H * P;
    plot(P_mirror(1), P_mirror(2), 'go', 'MarkerSize', 8);

    hold off;
    
    % Feliratok
    legend('Bemenő pont', 'Bemenő pont képe', 'Tükrözött pont', 'Hipersík');
    xlabel('X tengely');
    ylabel('Y tengely');
end
