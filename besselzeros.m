function [a Z x y] = xxxx(N, NN)
    tic
    l = 1e4;
    st =0.1;
    x = 0.1:st:l;
    xl = length(x);

    Z = zeros(NN, N);
    y = zeros(xl, N);

    f = @(x, t, n) 1 / pi * cos(x * sin(t) - t * n);
    f1 = @(x)integral(@(t)f(x, t, n), 0, pi);
    for n = 1:N
        s = 1;
        a = 1;
        z = 1;
        k = 1;
        
        while z < NN

            sold = s;
            s = integral(@(t)f(x(1, a), t, n), 0, pi);
            y(a, n) = s;
                        
            if (sold*s < 0)
                Z(z, n) = fzero(f1, x(1, a));
                z = z +1;
                a = a + fix(0.7*k);
                k = 0;
            end
            a = a + 1;
            k = k + 1;
        end
    end
    toc
    pl(a,Z,x,y)
end
