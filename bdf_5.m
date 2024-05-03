function [t, y] = bdf_5(f, a, b, h, y0)
    % Initialize arrays
    t = a:h:b;
    n = length(t);
    y = zeros(1, n);
    y(1) = y0;

    % Use a 4th order Runge-Kutta method to get initial values
    for i = 1:4
        k1 = h * feval(f, t(i), y(i));
        k2 = h * feval(f, t(i) + h/2, y(i) + k1/2);
        k3 = h * feval(f, t(i) + h/2, y(i) + k2/2);
        k4 = h * feval(f, t(i) + h, y(i) + k3);
        y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end

    % Backward Differentiation Formulas (BDF) 5th order method
    for i = 5:n-1
        y(i+1) = (300 * y(i) - 300 * y(i-1) + 200 * y(i-2) - 75 * y(i-3) + 12 * y(i-4) + 60 * h * feval(f, t(i+1), y(i+1))) / 137;
    end
end

