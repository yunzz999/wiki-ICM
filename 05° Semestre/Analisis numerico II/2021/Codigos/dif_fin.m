function [x,y,A]=dif_fin(p,q,g,alpha11,alpha12,alpha1,beta21,beta22,alpha2,a,b,n)
h=(b-a)/n; %cantidad de subintervalos
x=a:h:b;   %discretización

A=zeros(n+1,n+1);
B=zeros(n+1,1);

phi=@(x) (1+(h/2).*p(x));
psi=@(x) (2+(h.^2).*q(x));
varphi=@(x) (1-(h/2).*p(x));

A(1,1)=-alpha12+h.*alpha11;
A(1,2)=alpha12;
A(n+1,n)=-beta22;
A(n+1,n+1)=beta22+h*beta21;

B(1,1)=h*alpha1;
B(n+1,1)=h*alpha2;

for i=1:n-1
    A(i+1,i)=-phi(x(i+1));
    A(i+1,i+1)=psi(x(i+1));
    A(i+1,i+2)=-varphi(x(i+1));
    
    B(i+1,1)=(h^2)*g(x(i+1));
end

y=A\B;

end