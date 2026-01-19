clear all;close all;clc;
n = 150;
h = 1/(n+1);
b = 0;c = 5;d = 3;
a11 = 3 + c*h^2;
la = -1-b*h/2;
aii = 4+c*h^2;
ua = -1+b*h/2;
ann = 3-b*h/2 + c*h^2;  
bnn = 1-d/h;
A = aii*diag(ones(1,n)) + la*diag(ones(1,n-1),-1)  + ua*diag(ones(1,n-1),1);
A(1,1) = a11;
A(n,n) = ann;
B = eye(n,n);
B(n,n) = bnn;
A = (1/h^2)*A;
B = (-1/h^2)*diag(B);

D = zeros(n,n);
M = chol(A);
u = zeros(n,1);
r = B - A*u;
q = inv(M)*r;
p = q;
rsold = r'*q;

for i = 1:n
    Ap = A*p;
    alpha = rsold/(p'*Ap);
    u = u + alpha*p;
    r = r - alpha*Ap;
    q = inv(M)*r;
    rsnew = r'*q;
    p = q + (rsnew/rsold)*p;
    rsold = rsnew;
    if norm(rsnew/rsold) < 1e-10
        break
    end
end


D = zeros(n,n);
v = diag(A);
D = diag(v);
E = (-1)*tril(A,-1);
F = (-1)*triu(A,1);
J = inv(D)*(E+F);
vp = eig(J);
vps = abs(vp);
respj = max(vps);
w = 2/(1+sqrt(1-respj^2));
M = (1/(2-w))*((1/w)*D - E)*(1/w)*inv(D)*((1/w)*D - E');






