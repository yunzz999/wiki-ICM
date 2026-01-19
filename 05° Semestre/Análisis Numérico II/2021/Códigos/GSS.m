function [sol,convergencia,iteraciones] = GSS(A,b,x0,tol,maxiter)
% se resuelve sistema Ax = b con metodo de Jacobi

sol = x0;

[nA,mA] = size(A);

convergencia = 0;    
it = 1;
while ~convergencia && it <= maxiter
  % inicializar vector donde se almacena iterando a calcular en paso
  % actual
  % ciclo del metodo de Gauss-Seidel
  xnew = zeros(nA,1);
  for j = 1 : nA
    xnew(j) = (b(j) - A(j,1:j-1)*xnew(1:j-1) - A(j,j+1:nA)*x0(j+1:nA))/A(j,j);
  end 
  % se ha calculado el iterando actual, se comprueba si se alcanzo la
  % tolerancia requerida, para ello debe comprobarse si
  % coef*norm(diferencia entre iterando actual e iterando anterior)
  % es menor o igual que la tolerancia requerida, coef se especifica
  % en las transparencias del curso
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
  % aumentando numero de iteraciones
  it = it + 1;
end
sol = xnew;
iteraciones = it-1;