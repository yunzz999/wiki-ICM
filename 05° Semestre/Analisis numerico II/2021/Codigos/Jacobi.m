function solucion = Jacobi(A,b,x0,tol,Niter)
N=diag(diag(A));
P=-(tril(A,-1)+triu(A,1));
[a1 a2]=size(x0);
x = zeros(a1,Niter);
x(:,1) = x0;
for k = 2 : Niter
  x(:,k) = N\(P*x(:,k-1)+b); 
  if k>=3
    mk = norm(x(:,k)-x(:,k-1))/norm(x(:,k-1)-x(:,k-2));
    criterio = abs(mk/(1-mk)*norm(x(:,k)-x(:,k-1)));
    if criterio < tol || k == Niter
      solucion = x(:,k);
      num_iter = k
      break
    end
  end
end