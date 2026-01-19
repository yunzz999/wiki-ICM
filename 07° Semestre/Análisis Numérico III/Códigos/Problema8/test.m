%Test
LM = 8
f = @(x) cos(pi*x/2);
g = @(t) exp(-pi^2*t/4);
gtilde = @(t) 0;
Dx = 0.25;
Dt = Dx^2*LM;
X = 0:Dx:1;
T = 0:Dt:1;
N = 1/Dx-1;
M = length(T);
alpha = 1/2
%Construccion de la matriz B
B = 2*eye(N) + (-1)*diag(ones(1,N-1),1) + (-1)*diag(ones(1,N-1),-1);
% Construccion de gn
gbold = @(n)[g(T(n))+alpha*(g(T(n+1))-g(T(n)));
              zeros(N-2,1);
              gtilde(T(n))+alpha*(gtilde(T(n+1))-gtilde(T(n)) )];

u=zeros(N,M);
for i=2:N+1
    u(i-1,1)=f(X(i));
end
for j = 2:M
    A = eye(N)+alpha*LM*B;
    b = (eye(N)-(1-alpha)*LM*B)*u(:,j-1)+ LM*gbold(j-1)
    %u(:,j) = GS(A,b,zeros(N,1));

end
Uf = u;
