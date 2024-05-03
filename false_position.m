% False Position method
function root = false_position(fun, xl, xu, epslon, max_iter)


    if fun(xl) * fun(xu) >= 0
        error('The given values for xl and xu do not bracket the root.');
    else
        xr = xu - ((fun(xu) * (xu - xl)) / (fun(xu) - fun(xl)));  % Corrected the calculation of xr
        iter = 0;

        while abs((xu - xl) / xu) * 100 > epslon && iter < max_iter
            if fun(xl) * fun(xr) < 0
                xu = xr;
            else
                xl = xr;
            end
            xr = xu - ((fun(xu) * (xu - xl)) / (fun(xu) - fun(xl)));  % Corrected the calculation of xr

            iter = iter + 1;
        end

        if iter == max_iter
            warning('Maximum number of iterations reached. No convergence.');
        end

        root = xr;
    end
end

