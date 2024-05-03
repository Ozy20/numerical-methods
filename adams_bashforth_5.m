function [t, y] = adams_bashforth_5(f, a, b, h, y0)
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

    % Adams-Bashforth 5th order method
    for i = 5:n-1
        y(i+1) = y(i) + h/720 * (1901 * feval(f, t(i), y(i)) - 2774 * feval(f, t(i-1), y(i-1)) + 2616 * feval(f, t(i-2), y(i-2)) - 1274 * feval(f, t(i-3), y(i-3)) + 251 * feval(f, t(i-4), y(i-4)));
    end
end

