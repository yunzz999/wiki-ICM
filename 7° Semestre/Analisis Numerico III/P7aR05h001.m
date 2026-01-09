clear all;
% Caso R = 0.5
A = 4;B = 1/2;C = 3;D = 1/3;R = 0.5; a = 0; b = 5;
F = @(x,y)[A.*x - A.*B.*y.*(x - R); C.*y.*(D.*(x-R) - 1)];
% h = 0.001 
h1 = 0.001;
t1 = a:h1:b;
Y1 = zeros(2,length(t1));
Y1(:,1) = [3 5];
for i = 2:length(t1)
    Y1(:,i) = Y1(:,i-1) + h1*F(Y1(1,i-1),Y1(2,i-1));
end
plot(t1,Y1(1,:))
hold on
plot(t1,Y1(2,:))
grid on
legend('Aproximacion de x(t)','Aproximacion de y(t)')
title('Aproximacion mediante Euler explícito')
hold off
plot(Y1(1,:),Y1(2,:))
xlabel('x(t)')
ylabel('y(t)')
title('Número de presas vs número de depredadores')
grid on