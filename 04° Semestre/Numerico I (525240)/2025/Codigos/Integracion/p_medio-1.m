function int_pm = p_medio(f,a,b,n)
  h = (b-a)/n;
  % nodos de la regla de integración
  x = zeros(1,n+1);
  for i=1:n+1
    x(i) = a +(i-1)*h;
  end
  %vector auxiliar para evitar programar la suma
  R = zeros(1,n); %areas rectangulos
  for i=1:n
    R(i) = h*f((x(i)+x(i+1))/2);
  end
  int_pm = sum(R);
end