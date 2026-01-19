function A = matriz_tridiag_full (a,b,c,n)
  A = zeros(n,n);
  for i = 1:n
    for j = 1:n
      if i == j
        A(i,j) = a;
      elseif  i - j == -1
        A(i,j) = b;
      elseif i - j == 1  
        A(i,j) = c;
      else 
        A(i,j) = 0;
      end
    end
  end  
end
