%Problema 8
f = @(x) cos(pi*x/2);
g = @(t) exp(-pi^2*t/4);
gtilde = @(t) 0;

[X2,T2,U, M] = Paso_simple_ec_calor(f,g,gtilde,0.25,8,1/2);
