N=3000;
m=1.8;
E0=150;
S0=N-E0;
c=0.001;
Mp=@(t,M) m*(N-S0*exp(-(c/m)*M)-M);
M0=0;

[par,Ms]=ode45(Mp,[0 10],0);

p=spline(par,Ms);

S=S0*exp(-(c/m)*Ms);
E=N-Ms-S;

tt=linspace(0,10,100);

plot(par,Ms,"m--")
hold on
plot(par,S,"g--")
hold on
plot(par,E,"b--")
hold on
plot(tt,ppval(p,tt),"k")
grid on
ppval(p,8)
% 3. al cabo de aprox 5sem. 
% 4. muertas semana 8= 2.1186e+03
legend("Personas Muertas","Personas Sanas","Personas Enfermas")