function xap = biseccion(f,a,b,tolerancia,N)
  % Funcion para determinar una aproximacion a cero de f
  % en [xa,xb]
  % tolerancia es la exactitud con que se desea calcular la aproximacion
  % N es la cantidad maxima de iteraciones a realizar por el metodo
  
  if (f(a)*f(b) >= 0) || (b <= a)
    error('no es posible aplicar biseccion')
  end
  % numero de iteraciones a realizar con el metodo de biseccion
  M = ceil(log2((b-a)/tolerancia));
  % Si M es mayor que N, no es posible cumplir con la condicion de que
  % el numero de iteraciones sea menor o igual que N
  if M > N
    error('N es muy pequenno');
  end
  % Vector con iterandos de biseccion
  xk = zeros(M,1);   
  % M iteraciones de biseccion
  for i = 1:M
    % punto medio entre a y b
    xr=(a+b)/2;      
    % Actualizando a y b    
    if f(a)*f(xr) < 0               
        b=xr;                      
    elseif f(b)*f(xr) < 0
        a=xr;            
    else
        % el producto tiene que ser cero y xr es un cero de f
        xk(i) = xr;
        break;    
    end
    % Se guarda el iterando en el vector xk
    xk(i) = xr;
  end
  % La aproximacion por biseccion a un cero de f es el ultimo punto medio
  % calculado
  xap = xk(i);
  iteraciones = i;
  display('Aproximacion calculada de forma exitosa con metodo de biseccion')
  iteraciones
  end
