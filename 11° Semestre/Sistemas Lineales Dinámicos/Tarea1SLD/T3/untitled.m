clear; clc;
A = [1,1;
     0,-2];
B = [0;1];
C = [0,1];
D = 0;
sys = ss(A,B,C,D);
pzmap(sys)