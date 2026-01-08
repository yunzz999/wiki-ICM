%datos iniciales
A=[27 -24 24 -25; -24 27 -25 24; 24 -25 27 -24; -25 24 -24 27];
b = [-49 51 -41 59]';
x(1) = zeros(size(A,1),1);
tol=1e-6;

%primera iteración del método
r(1)=b-A*x(1);
p(1)=r(1);
a(1)=(r(1)'*r(1))/(p(1)'*A*p(1));

%iteración del método
for i=2:size(A,1)
    
    r(i)=r(i-1)-a(i-1)*A*p(i-1);
    
    p(i)=r(i)+((r(i)'*r(i))/(r(i-1)'*r(i-1)))*p(i-1); %aqui esta incluido el b_k
    
    a(i)=(r(i)'*r(i))/(p(i)'*A*p(i));
    
    x(i)=x(i-1)+a(i-1)*p(i-1);
    
    if norm(p(i)) < tol
        break;
    end
    
end

    