clear all; close all; clc;
f=inline('sin(x)+x-x.^2','x');
ezplot(f); grid on; hold all;       
xlim([-0 4])
xa=1; xb=3;                                  
xk =[];                             
epsilon =  10^(-4);                                                         
while abs(xa-xb)>=epsilon           
    plot([xa,xb],f([xa,xb]),'*k');  
    xr=(xa+xb)/2;                   
    plot(xr,f(xr),'*r');                
    pause(1);                       
    if f(xa)*f(xr)<0                
        xb=xr;                      
    elseif f(xa)*f(xr)==0
        xa=xb
    elseif f(xa)*f(xr)>0
        xa=xr;                      
    end
    xk = [xk;xr]                    
    error=abs(f(xr)-0)  
end