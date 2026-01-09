%GaussSeidel forward
function [x] = GS(A,B,x0)
normVal=Inf;
itr=0;
tol = 10^(-4);
x=x0;
n=size(x,1);
while normVal>tol
    x_old=x;
    
    for i=1:n
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
  
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        
        x(i)=(1/A(i,i))*(B(i)-sigma);
    end
    
    itr=itr+1;
    normVal=norm(x_old-x);
end
end

