clear all;
% Caso R = 2
A = 4;B = 1/2;C = 3;D = 1/3;R = 2; a = 0; b = 5;
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
hold off
plot(Y1(1,:),Y1(2,:))
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
hold off
plot(Y2(1,:),Y2(2,:))
