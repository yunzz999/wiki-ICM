function [errorL2,normaH1,h] = fem1d(M,a,b,f,w,dw,g1,g2)

%Cantidad de subintervalos
%M = 50*2;

%Cantidad de nodos interiores
n = M - 1;

%particion del intervalo
x = linspace(a,b,M+1)';

h = (b-a)/M;
D = 2./h.*spdiags(ones(n,1),0,n,n);
S = -1./h.*spdiags(ones(n,1),1,n,n);
I = -1./h.*spdiags(ones(n,1),-1,n,n);
A = D + S + I;

%vector con puntos medios
y = (x(1:end-1) + x(2:end))./2;

%f evaluada en los puntos medios
fM = f(y);
L = (fM(1:end-1) + fM(2:end)).*h./2;

%resolvemos el sistema lineal
alfa = A\L;
sol = [0;alfa;0];

%graficamos
t = linspace(a,b,200);
z = @(x) 1/(b-a).*(b*g1-a*g2+(g2-g1).*x);
plot(x,sol + z(x),'r',t,w(t),'b')

%error L2
u = @(x) w(x) - z(x);
errorL2 = sqrt(h.*sum((u(x(2:end-1))- alfa).^2));

%error H1
du = @(x) dw(x) - 1/(b-a)*(g2-g1);
T = [];
T(1) = (du(x(1))-alfa(1)/h)^2;
T(2) = (du(x(end-1))+alfa(end)/h)^2;
T(4) = (du(x(2))-alfa(1)/h)^2;
T(5) = (du(x(end))+alfa(end)/h)^2;
T(3) = sum((du(x(2:end-2)) + alfa(1:end-1)./h - alfa(2:end)./h).^2);
T(6) = sum((du(x(3:end-1)) + alfa(1:end-1)./h - alfa(2:end)./h).^2);

semi_normaH1 = sqrt(h/2*sum(T));
normaH1 = sqrt(errorL2^2+semi_normaH1^2);
