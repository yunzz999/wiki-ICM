f=@(x) 1./(1+x.^2);
I=pi./4;

i=1;
diff=1;
while diff>(1e-6)
    J1=punto_medio(0,1,f,i);
    J2=punto_medio(0,1,f,2*i);
    diff=abs(J2-J1);
    i=2*i;
end
4*J2
pi-4*J2
