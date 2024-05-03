%gauss
function [x] = gaussSeidel(A, b, x0, epsoln, maxIter)
    n = length(b);
    x = x0;
    iterations = 0;

    while iterations < maxIter
        x_old = x;

        for i = 1:n
            sigma = A(i, 1:i-1) * x(1:i-1) + A(i, i+1:n) * x_old(i+1:n);
            x(i) = (b(i) - sigma) / A(i, i);
        end

        % Check for convergence using error percentage
        if norm(x - x_old, inf) / norm(x, inf) * 100 < epsoln
            return;
        end

        iterations = iterations + 1;
    end
end

