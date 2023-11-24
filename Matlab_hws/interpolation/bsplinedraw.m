function bsplinedraw(index)
    % B-Spline függvények rekurzív számítása
    function result = bspline(l, k, x)
        if l == 0
            result = 1;
        else
            term1 = (x - index(k)) / (index(k + l) - index(k)) * bspline(l - 1, k, x);
            term2 = (index(k + l + 1) - x) / (index(k + l + 1) - index(k + 1)) * bspline(l - 1, k + 1, x);
            result = term1 + term2;
        end
    end

    % B-Spline függvények kirajzolása
    hold on;
    for k = 1:length(index) - 1
        x_vals = linspace(0, 1, 100);
        y_vals = arrayfun(@(x) bspline(length(index) - 2, 1, x), x_vals);
        % Átskálázás a [0, 1] tartományba
        y_vals = (y_vals - min(y_vals)) / (max(y_vals) - min(y_vals));
        plot(x_vals, y_vals);
    end

    title('B-Spline függvények');
    xlabel('x');
    ylabel('B-Spline');
    grid on;
    hold off;
end
