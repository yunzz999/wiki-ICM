A = [-2 -1;1 -2];
B = [1 1;2 -1];
C = [1 0];
D = [0 1];
ltiSys = ss(A,B,C,D);
sys = tf(ltiSys);
