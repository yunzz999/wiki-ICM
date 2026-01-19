function int_tr = trapecios(f,a,b,n)
  h = (b-a)/n;
  % nodos de la regla de integración
  x = zeros(1,n+1);
  for i=1:n+1
    x(i) = a +(i-1)*h;
  end
  %vector auxiliar para evitar programar la suma
  T = zeros(1,n); %area de cada trapecio
  for i=1:n
      base1 = f(x(i));
      base2 = f(x(i+1));
      altura = h;
      T(i) = (base1 + base2)/2*altura; %base trapecio
  end
  int_tr = sum(T); %sumo las areas
end
