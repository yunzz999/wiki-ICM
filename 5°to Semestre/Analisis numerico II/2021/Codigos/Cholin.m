clear all;close all;clc;
n = 100;
h = 1/(n+1);
b = 0;c = 5;d = 3;
A = matriz_tridiag_full((2+c*h^2),(b*h-2)/2,-(b*h+2)/2,n);
A(n,:) = [zeros(1,n-2) ((-b*h*2-h)/(2*h+2*d)) ((4 + (2+2*c)*h^2)/(2*h+2*d))];
%A(n,:) = [zeros(1,n-2) -2/(1+(d*b-2*(d/h))) (2*(h^2)*(b+c)-4*(h*b-1))/(2+2*(d*b-2*(d/h)))];
%A(n,:) = [zeros(1,n-3) h/2 b*h^2 -h/2];
H = zeros(n,n);
G = sparse(A);
L = ichol(G);
k = L*L';
for j = 1:n
    h = (H(j,1:j-1)).^2;
    H(j,j) = sqrt(A(j,j) - sum(h));
    for i = j+1:n
       if A(i,j) == 0
           H(i,j) = 0;
       else
           g = H(i,1:j-1).*H(j,1:j-1);
           H(i,j) = (1/(H(j,j)))*(A(i,j)-sum(g));
       end    
    end
end     
B = H*H';

