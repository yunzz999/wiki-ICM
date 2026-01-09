% Problema 5
clear all; close all; clc
Dx = 0.05;
LM = 1/6;
Dt = Dx^2*LM;
X = 0:Dx:1;
T = 0:Dt:1;
f = @(x) sin(x*pi);
g = @(t) t*(1-t)^2;
gtilde = @(t) t;
N = 1/Dx-1;
M = length(T);
alpha = 0;
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


for j = 1:M-1        
    plot(X(2:end-1),u(:,j),'linewidth',2);
    grid on;
    axis([min(X) max(X) 0 1]);
    xlabel('X axis','fontSize',14);
    ylabel('u','fontSize',14);              
    titlestring = ['TIME STEP = ',num2str(j), ' TIME = ',num2str(T(j)), 'second'];
    title(titlestring ,'fontsize',14);                            
    h=gca; 
    get(h,'FontSize'); 
    set(h,'FontSize',10);
    fh = figure(5);
    set(fh, 'color', 'white'); 
    F=getframe;
end
movie(F,M,1)

