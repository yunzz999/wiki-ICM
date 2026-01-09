close all;
clear all;
clc;
%datos
f = @(x) 0;%(pi^2).*cos(pi.*x);%@(x) 0; 
u = @(x) x;%cos(pi.*x); %@(x) x;;

%Intervalo [a,b]
a=0;
b=1;

n = 8;

M = n+1;

%Longitud de cada subintervalo
h = (b-a)/M;

%Particion del intervalo
x = [a:h:b]';

%seleccionar gamma
gma = 100; %input('ingresar valor de gamma: ');
a = 1/2;
b= -1/2;
c = 1-gma;

%Calculamos la matriz A
D = diag(gma.*ones(2.*(n+1),1)'); %diagonal
v1 = zeros(2.*n+1,1)';
v1(2:2:end) = c;
Ds = diag(v1,1);
Di = diag(v1,-1);
v2 = b.*ones(2.*n,1)';
Ds = Ds + diag(v2,2);
Di = Di + diag(v2,-2);
D(1) = D(1)-1;
D(2.*(n+1),2.*(n+1)) = D(2.*(n+1),2.*(n+1))-1;
D(1,2) = a;
D(2,1) = a;
D(2.*(n+1)-1,2.*(n+1)) = a;
D(2.*(n+1),2.*(n+1)-1) = a;
A =1./h.*( D+Di+Ds);

ua = 0;%1;%0;
ub = 1;%-1; %1; 

%Calculamos el vector 
xM = (x(2:end)+x(1:end-1))/2; %vector de puntos medios
F = f(xM);
v3 = zeros(2.*(n+1),1);
v3(1:2:end) = F; 
v3(2:2:end) = F;
b = h./2.*v3;
F2 = zeros(2.*(n+1),1);
F2(1) = -c.*ua;
F2(2) = ua;
F2(end) = -c.*ub;
F2(end-1) = ub;
b = b +1./h.*F2 ;

%resolvemos el sistema
alfa = A\b;
%hold on;
%Graficamos la solucion 
x2=zeros(2*length(x)-4,1);
x1=x(2:end-1);
x2(1:2:end-1)=x1;
x2(2:2:end)=x1;
y=0:1/1000:1;
hold on;
plot(y,u(y),'red')
plot([0 x2' 1], alfa,'blue')

alfa1=alfa(2:end-1);
%error L2
errorL2 = sqrt(h./2.*(sum((u(x2(1:end))-alfa1).^2)));

%error DG

%norma L2 de derivada 
errDL2 = sqrt(h./2.*sum((diff(u(x2(1:end)))-diff(alfa1)).^2));
%calculo del salto
izq = alfa1(1:2:end-1);
der = alfa1(2:2:end);
salto = sum((1/h).*(abs(izq-der).^2));

errorDG = sqrt(errDL2.^2+salto);
h
errorL2
errorDG

