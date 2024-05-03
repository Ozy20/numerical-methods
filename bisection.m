% Bisection method
function root = bisection(fun, xl, xu, epslon, max_iter)

    if fun(xl) * fun(xu) >= 0
        error('The given values for xl and xu do not bracket the root.');
    else
        xr = (xl + xu) / 2;
        iter = 0;
        xro=0;
        while abs((xr - xro) / xr) * 100 > epslon && iter < max_iter && fun(xr) ~= 0
            if fun(xl) * fun(xr) < 0
                xu = xr;

            else
                xl = xr;
            end
            xro=xr;
            xr = (xl + xu) / 2;

            iter = iter + 1;
        end

        if iter == max_iter
            warning('Maximum number of iterations reached. No convergence.');
        end

        root = xr;
    end
end

