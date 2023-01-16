
function [b, z] = abc(xx)
    tol = 1e-3;
    b = 0:0.05:3.7;
    %3.56;
    x = xx;
    z = [];
    u = 1;

    for i = 1:length(b)
        b(1, i)
        
        y = rand(1,u*2);
        c = 1;
        Y = x;
                
        u
        
        while (1)

            y(1, 1) = b(1, i) * Y * (1 - Y);
            
            y;
            for j = 2:u*2
                y(1, j) = b(1, i) * y(1, j-1) * (1 - y(1, j-1));
            end
            y;
            
            o = 0;
            for j = 1:u
                y;
                abs(y(1, j) - y(1, u + j));
                if (abs(y(1, j) - y(1, u + j)) < tol)
                    o = o + 1;
                end

            end

            if (o == u)
                fprintf('A\nA\nA\nA\nA\nA\nA\nA\nA\nA\nA\n')
                y;
                c
                z(1:u, i) = y(1, u + 1:end);
                break;
            end

            c = c + 1;

            if (c > 2000000)
                u = u * 2
                y = [rand(1,u),y];
                c = 0;
            end
            Y = y(1,u*2);
        end
        y;
    end

        plot(b,z,'-')
end
