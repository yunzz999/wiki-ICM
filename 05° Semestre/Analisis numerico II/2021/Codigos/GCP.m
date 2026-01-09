function [u,M] = GCP(A,b)
n = length(A(1,:)); %Largo de la matriz
L = chol(A); % Aplicamos cholesky a la matriz A
M = L*L';    % A la matriz obtenida de aplicar cholesky la multiplicamos por la traspuesta de la misma 
             % para asi obtener una aproximacion de A que esta mejor
             % condcionada
u = zeros(n,1);
r = b - A*u;   %Primer residuo obtenido cuando u = (0,...,0)
q = inv(M)*r;
p = q;
rsold = r'*q;

for i = 1:n
    Ap = A*p;
    alpha = rsold/(p'*Ap);           %iteracion que obtiene los residuos de acuerdo a los vectores obtenidos                  
    u = u + alpha*p;                 % de cada iteracion. El ciclo se detiene cuando el residuo es menor a 10^-10
    r = r - alpha*Ap;
    q = inv(M)*r;
    rsnew = r'*q;
    p = q + (rsnew/rsold)*p;
    rsold = rsnew;
    if norm(rsnew/rsold) < 1e-10
        break
    end
end
end