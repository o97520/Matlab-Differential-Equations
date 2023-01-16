function [sol Z] = lenl(x,y,z)
    s = 10;
    r = 28;
    b = 8/3;
    c = 0;
    tol=1e-6;
    error= 1;
    Z = ones(1,3);
    while error >  tol

        c= c+1;
        
        Z(c,1:3) = [x y z];


        A = [-s s 0;r-z -1 -x;y x -b];


        B = [-1*s*(y-x);-1*(x*(r-z)-y);-1*(x*y-b*z)];
        
        

        X = A\B;
        
        x = x+X(1,1);
        y = y+X(2,1);
        z = z+X(3,1);
        sol = [x y z]
        error = max(abs(X));
        
    end
        plot3(Z(:,1),Z(:,2),Z(:,3),'*--')

end