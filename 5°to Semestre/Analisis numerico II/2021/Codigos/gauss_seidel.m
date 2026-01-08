function[sol,convergencia,iteraciones] = gauss_seidel(A,b,x0,tol,maxiter)
sol = x0;

[nA,mA] = size(A);

convergencia = 0;    
it = 1;
while ~convergencia && it <= maxiter
  xnew = zeros(nA,1);
  for j = 1 : nA
    xnew(j) = (b(j) - A(j,1:j-1)*xnew(1:j-1) - A(j,j+1:nA)*x0(j+1:nA))/A(j,j);
  end
  if it >= 2
    nM = norm(xnew-x0)/norm(x0-x00);
    coef = nM/(1-nM);
    if coef <= 0
      coef = 1;
    end
  else
    coef = 1;
  end
  convergencia = (coef*norm(xnew-x0) <= tol);
  x00 = x0;
  x0 = xnew;
  it = it + 1;
end
sol = xnew;
iteraciones = it-1;