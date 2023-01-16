tol = 1e-8;
x = 0.1;
r = 0:0.1:10;
error = 2*tol;
for i = 1:length(r)
    x = 0.1;
    error = 2*tol;
while(error>tol)
    xold = x;
    x = r(1,26)*x*(1-x);
    error = abs(x-xold);
end
fprintf('%f\n',x)

end