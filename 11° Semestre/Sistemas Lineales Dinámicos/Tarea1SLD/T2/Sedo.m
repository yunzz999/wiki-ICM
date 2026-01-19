function [dx] = Sedo(t,x,A,B,C,e)
R = 0.5; L = 50; a = 2; 
ki = 3*10^(-3);l1 =50; l0 = 30;
M = 250; k = 24.5; d = 1.5;
dx = A*[x(1);x(2)] + B*e;
end