function e = abcde(A)


    a = eye(length(A));
    a = a(1:length(A),1);
    b = a;
    for i = 1:10
       
        b = A*b;
        
    end
    
    c = A*b;
    
    n = b'*c;
    d = c'*c;
    e = d/n;

end