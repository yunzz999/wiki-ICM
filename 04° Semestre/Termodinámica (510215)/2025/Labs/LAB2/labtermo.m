e1=[15,13,11,9,7,5];
e1=e1.^3;
y1=[3.7,4.5,5.2,6.4,8.2,11.5];
y2=[7.5,9,10.2,13,16.7,23];
y3=[11.4,13.5,15.5,19.2,24.7,34.7];

p=polyfit(e1,y1,5);
q=polyfit(e1,y2,5);
s=polyfit(e1,y3,5);

plot(e1,polyval(p,e1),"r")
hold on
plot(e1,polyval(q,e1),"b")
hold on
plot(e1,polyval(s,e1),"g")
grid on
legend("n=50","n=100","n=150")
xlabel("Volumen [nm]^3")
ylabel("Presion [atm]")
