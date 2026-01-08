clear all; close all; clc;
%% Implementacion particular del metodo de la biseccion
f = @(x) x.^2-9; 
xa = 0; 
xb = 4;                                
xk = [];                             %
epsilon =  10^(-4);                  %                                       
while abs(xa-xb)>=epsilon           %
    xr=(xa+xb)/2;                   %
    if f(xa)*f(xr)<0                %
        xb = xr;                      %
    elseif f(xa)*f(xr)==0
        xa = xb;
    elseif f(xa)*f(xr)>0
        xa = xr;                      %
    end
    xk = [xk;xr];                    %
    error=abs(f(xr)-0);  
end
sprintf('La solucion de f(x) = 0 es x = %d',xk(end))
                %
