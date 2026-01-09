function [M]=matrizrara(n)
M=zeros(n,n);
for i=1:n
    M(i,i)=i;
end