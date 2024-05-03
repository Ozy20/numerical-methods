%newton_raphson
function root = newton_raphson(fun, df, x0, spelon, max_iter)

    iter = 0;
    xlast = x0;

    while iter < max_iter
        x0 = xlast - fun(xlast) / df(xlast);

        % Check for convergence based on percentage accuracy
        if abs((x0 - xlast) / x0) * 100 < spelon
            root = x0;
            return;
        end

        xlast = x0;
        iter = iter + 1;
    end

    error('Maximum number of iterations reached. No convergence.');
end

