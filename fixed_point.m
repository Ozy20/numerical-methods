%fixed_point
function root = fixed_point(g, x0, epselon, max_iter)

    iter = 0;
    xlast = x0;

    while abs((x0 - xlast) / x0) * 100 > epselon && iter < max_iter
        x1 = g(x0);
        xlast = x0;
        x0 = x1;
        iter = iter + 1;
    end
    root = x0;
end

