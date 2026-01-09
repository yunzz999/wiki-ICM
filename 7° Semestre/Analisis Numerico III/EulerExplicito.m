function [t,Y] = EulerExplicito(F,z0,a,b,h)   
  t = a:h:b;
  Y = z0;
  for i = 2:length(t)
    Y(:,i) = Y(:,i-1) + h*F(t(i-1),Y(:,i-1));  
  end
end