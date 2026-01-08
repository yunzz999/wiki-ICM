function[x, s] = precondconjgrad(A, b, tol, smax, solveM)
n = length(b);
x = zeros(n, 1);
r = b;
z = solveM(r);
p = z;
delta = r' * p;
nr = norm(r);
s = 0;
while (s < smax) && (nr >= tol)
    q = A * p;
    alpha = delta/(p' * q);
    x = x + alpha*p;
    rold = r;
    r = r - alpha*q;
    z = solveM(r);
    deltaold = delta;
    delta = r' * z;
    nr = norm(r);
    beta = delta/deltaold;
    p = z + beta*p;
    s = s + 1;
end
end