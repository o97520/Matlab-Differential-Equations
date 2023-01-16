function [P R]= abcd()
    syms x a;
    P(1,1) =  x * a * (1 - x);
    Pd(1,1) = diff(P(1,1));
    R = zeros(1,3)
    for i = 1:10
               
        P1 = subs(P(1,i), x, P(1,1)); 
        
        P(1,i+1) = P1
        
        P1 = subs(P1-0.5,x,0.5);
        
        Pd(1,i+1) = diff(P1);

        r2 = P1;
        r3 = Pd(1,i+1);
        A = 1;
        for j = 1:i*2+1
            if(A)
                [N A] = n(r2,r3);
                R(j,i) = N

                syms a;
                P(1,i+1);

                a-N;
                r2 = deconv(sym2poly(r2),sym2poly(a-N))
                r2 = poly2sym(r2)
                r3 = diff(r2)
            end
            
        end
        
        
    end

end

function [x1 A] = n(P,Pd)
    x00 = 1;
    x1 = 500;
    tol = 1e-10;
    syms  x a;
    
    P;
    Pd;
    x0=x00;
    c=0;
    while 1
        c=c+1
        Pdx = double(subs(Pd,x0));
        
        Px = double(subs(P,x0));
        if(Pdx == 0 || Px == Inf || Pdx == Inf || Px == -Inf || Pdx == -Inf || isnan(Px) || isnan(Pdx)|| x1 == Inf || x1 == -Inf  || isnan(x1) && c > 100 )
            x0 = x00+randi(5,1,1)-5;
            Pdx = double(subs(Pd,x0));
            c=0;
        end
        
        if(c>120)
        A = 0
            return
            
        end
        
        
        x1 = x0 -  Px/Pdx;
        error = abs(x1-x0);
        if(error<tol)
            c
            A = 1
            return
        end
        
        x0 = x1;
        
    end

end
