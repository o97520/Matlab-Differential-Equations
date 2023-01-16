function besselz()
    
    f = @(x,t,n) 1/pi * cos(x*sin(t)-t*n);
    
    for i = 1:5

        n = i;
        syms x
        s =0
        
        while(1)
            
            Io = I
            
            I = integral(@(t)f(x,t,n), 0, pi)
            
            if((I < Io)+s)
                
                x = fzero(I,x0)
                s = -1;
            
            end
                        
        end
        
    end
    
end