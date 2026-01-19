h = 0.1;
clear all;close all;clc;
lambda = [10,1,0.1,0.01];
T = [100,200,400,800];
h = 0.1;
for i = 1:length(lambda)
  F = @(t,Z) [-Z(1)*(lambda(i) - Z(2) + Z(1));-Z(2)*(Z(2)-Z(1))]
  [t,Y] = EulerExplicito(F,[1;1],0,T(i),h);
  figure(i)
  subplot(1,3,1)
  plot(t,Y(1,:))
  subplot(1,3,2)
  plot(t,Y(2,:))
  subplot(1,3,3)
  plot(Y(1,:),Y(2,:))
  pause
end
