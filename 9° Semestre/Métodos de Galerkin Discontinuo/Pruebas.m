clear all; close all; clc;
x = [0:0.5:1];
y = [1,2,2.5,4];

for i = 1:(length(x)-1)
    hold on
    x1 = linspace(x(i),x(i+1));
    y1 = linspace(y(2*i-1),y(2*i));
    plot(x1,y1);
end

