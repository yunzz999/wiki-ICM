function dxdt = SEDON2(t,x,u)
R = 0.5; L = 50; a = 0.02; 
ki = 3*10^(-3);l1 =0.5; l0 = 0.3;
M = 0.25; k = 24.5; d = 1.5;
dxdt = [];
dxdt(2) = x(2);
dxdt(3) = (ki*(u(t).^2))/((R^2)*M.*(l1-x(1)+a))-(k/M).*(x(1)-l0)-(d/M).*x(2);
dxdt = [dxdt(1) dxdt(2)]';
end