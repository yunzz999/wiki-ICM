%Sistema1

f1=@(x,y) 2*x^2+y^2-1;
dxf1=@(x,y) 4*x;
dyf1=@(x,y) 2*y;

f2=@(x,y) 3*x+y^2-2;
dxf2=@(x,y) 3;
dyf2=@(x,y) 2*y;


[aprox,iter]=newton2D(f1,f2,dxf1,dyf1,dxf2,dyf2,[1,3],1e-6,100000);
aprox
iter