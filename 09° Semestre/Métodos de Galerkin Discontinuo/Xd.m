clear all; close all; clc;
% M cantidad de elementos
a = 0;
b = 1;
gamma = 100;
%termino fuente f(x)
f = @(x) pi.^2.*cos(pi.*x);

%solucion exacta para comparar
w = @(x) cos(pi.*x); %solucion exacta
dw = @(x) pi.*sin(pi.*x); %derivada solucion exacta

%condiciones de contorno
g1 = w(a);
g2 = w(b);
M = 9;
n = M - 1;
N = 2*(n+1);
%particion del intervalo
x = linspace(a,b,M+1)';
h = (b-a)/M;
dp = [gamma-1;gamma.*ones(N-2,1);gamma-1];
v = zeros(N-3,1);
r = max(find(rem([1:N-3],2)==0));
SS = zeros(N);
for i = 1:N-3
    if rem(i,2)==0
        v(i) = 0;
    else    
    v(i) = 1-gamma;
    end
end    
sd = [1/2;v;1/2];
D = 1./h.*diag(dp,0);
Ssup = 1./h.*diag(sd,1);
Sinf = 1./h.*diag(sd,-1);
Isup = -1./h.*diag(1/2.*ones(N-2,1),2);
Iinf = -1./h.*diag(1/2.*ones(N-2,1),-2);
A = D + Sinf + Ssup + Iinf + Isup;
%vector con puntos medios
y = (x(1:end-1) + x(2:end))./2;
%f evaluada en los puntos medios
xM = (x(2:end)+x(1:end-1))/2; %vector de puntos medios
F = f(xM);
v3 = zeros(2.*(n+1),1);
v3(1:2:end) = F; 
v3(2:2:end) = F;
b = h./2.*v3;
F2 = zeros(2.*(n+1),1);
F2(1) = -(1-gamma).*g1;
F2(2) = g1;
F2(end) = -(1-gamma).*g2;
F2(end-1) = g2;
b = b +1./h.*F2 ;
alfa = A\b;
% grafiquemos la solucion
for i = 1:(length(x)-1)
    hold on
    x1 = linspace(x(i),x(i+1));
    y1 = linspace(alfa(2*i-1),alfa(2*i));
    plot(x1,y1,'blue');
end
plot(x,w(x),'red')