function int_sp = simpson(f,a,b,n)
  h = (b-a)/n;
  % nodos de la regla de integración
  x = zeros(1,n+1);
  for i=1:n+1
    x(i) = a +(i-1)*h;
  end
  %vector auxiliar para evitar programar la suma
  V_f = zeros(1,n);
  for i=1:n
    V_f(i) = sp_elemental(f,x(i),x(i+1));
  end
  int_sp = sum(V_f);
end