function [errorL2,errorDG,h] = IPDG(M,a,b,f,w,dw,g1,g2,gamma)

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
F = f(y);
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
alfa1=alfa(2:end-1);
x2=zeros(2*length(x)-4,1);
x1=x(2:end-1);
x2(1:2:end-1)=x1;
x2(2:2:end)=x1;
%error L2
errorL2 = sqrt(h./2.*(sum((w(x2(1:end))-alfa1).^2)));
%error DG

%norma L2 de derivada 
errDL2 = sqrt(h./2.*sum((diff(w(x2(1:end)))-diff(alfa1)).^2));
%calculo del salto
izq = alfa1(1:2:end-1);
der = alfa1(2:2:end);
salto = sum((1/h).*(abs(izq-der).^2));

errorDG = sqrt(errDL2.^2+salto);
end