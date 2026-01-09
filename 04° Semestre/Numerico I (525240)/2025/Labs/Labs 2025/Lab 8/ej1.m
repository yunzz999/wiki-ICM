alpha=0.01; % que tanto interactuanw
c1=@(t,c,z) 2*c - alpha*c*z;
z1=@(t,c,z) -z + alpha*c*z;

tf=12; %cantidad de años

%Poblaciones Iniciales
c0=1000;
z0=100;

[particione,cexp,zexp]=euler_explicito_2orden(0,tf,c1,z1,c0,z0,100);


plot(particione,cexp,"r-")
hold on
plot(particione,zexp,"b-")
grid on
legend("Conejos c(t)","Zorros z(t)")

%Conclusion si la poblacion inicial de zorros y conejos se parece mucho
% y alpha>0 los zorros depredaran muy rapido y por tanto crecera su
% poblacion mientras que la de los conejos decae hasta 0. por tanto si
% alpha>0 deben haber mas conejos que zorros , al parecer el doble asegura
% estable, quizas existe una relacion tal que asegura mantener
% estabilidad.

