function [h, q] = arnoldi(A, Q, k)
  q = A*Q(:,k);   
  for i = 1:k     %Gram-Schmidt modificado, manteniendo la matriz de Hessenberg 
    h(i) = q' * Q(:, i);
    q = q - h(i) * Q(:, i);
  end
  h(k + 1) = norm(q);
  q = q / h(k + 1);
end
