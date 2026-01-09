function [X,T, Uf, M] = Paso_simple_ec_calor(f,g,gb,Dx,LM,alpha)
Dt = Dx^2*LM;
X = 0:Dx:1;
T = 0:Dt:1;
N = 1/Dx-1;
M = length(T);
%Construccion de la matriz B
B = 2*eye(N) + (-1)*diag(ones(1,N-1),1) + (-1)*diag(ones(1,N-1),-1);
% Construccion de gn
gvec = @(n)[n*Dt*(1-Dt*n)^2+alpha*((n+1)*Dt*(1-(n+1)*Dt)^2-Dt*n*(1-Dt*n)^2);
    zeros(N-2,1);
    n*Dt+alpha*((n+1)*Dt-n*Dt)];

%%creacion u0
u=zeros(N,M-1);
for i=1:N
    u(i,1)=f(X(i));
end
for j = 2:M-1
    A = eye(N)+alpha*LM*B;
    b = (eye(N)-(1-alpha)*LM*B)*u(:,j-1)+ LM*gvec(T(j));
    u(:,j+1) = GS(A,b,zeros(N,1));

end
Uf = u;
