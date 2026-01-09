clear all;
% Caso R = 1
A = 4;B = 1/2;C = 3;D = 1/3;R = 1; a = 0; b = 5;
F = @(x,y)[A.*x - A.*B.*y.*(x - R); C.*y.*(D.*(x-R) - 1)];
% h = 0.0005
h2 = 0.0005;
t2 = a:h2:b;
Y2 = zeros(2,length(t2));
Y2(:,1) = [3 5];
for i = 2:length(t2)
    Y2(:,i) = Y2(:,i-1) + h2*F(Y2(1,i-1),Y2(2,i-1));
end
plot(t2,Y2(1,:))
hold on
plot(t2,Y2(2,:))
grid on
legend('Aproximacion de x(t)','Aproximacion de y(t)')
title('Aproximacion mediante Euler explícito')
hold off
plot(Y2(1,:),Y2(2,:))
xlabel('x(t)')
ylabel('y(t)')
title('Número de presas vs número de depredadores')
grid on