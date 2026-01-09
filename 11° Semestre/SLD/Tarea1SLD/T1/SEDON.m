function dxdt = SEDON(t,x,u)
R = 0.5; L = 50; a = 0.02; 
ki = 3*10^(-3);l1 =0.5; l0 = 0.3;
M = 0.25; k = 24.5; d = 1.5;
dxdt = [];
dxdt(1) = -(R/L).*x(1) + (1/L).*u(t); 
dxdt(2) = x(3);
dxdt(3) = (ki*(x(1).^2))/(M.*(l1-x(2)+a))-(k/M).*(x(2)-l0)-(d/M).*x(3);
dxdt = [dxdt(1) dxdt(2) dxdt(3)]';
end