clear all;close all;clc;
A = [2 1;1 2;3 4]; 
Aux = A;
b = [29; 25; 34]; 
c = [-1;-1]; 
I = eye(length(A(:,1))); 
A = [A I]; 
c = [c;zeros(length(A(:,1)),1)];
index = 1:length(c);
indexN = index(1:(length(Aux(1,:))));
indexB = index((length(indexN)+1):end);
B = [];
N = [];
cN = [];
cB = [];
for i=1: length( indexN )
    N = [N A(:, indexN(i))];
    cN =[ cN;c(indexN(i))];
end
for i=1: length( indexB )
    B =[B A(:, indexB(i))];
    cB =[cB ;c( indexB(i))];
end
xb=B\b;
xn = zeros(length(N(: ,1)) ,1);
BN = inv(B)*N;
z = (cB')*BN;
costorelativo = z - cN';

for l = 1:length(costorelativo)
    if (costorelativo(l) < 0 | costorelativo(l) == 0)
        crt(l) = 1;
    else 
        crt(l) = 0;
    end
end    

if sum(crt) == length(costorelativo)
    Sol = 'La solucion es optima';
else 
    Sol = 'La solucion no es acotada';   
end

while max(costorelativo)>=0
    xb=B\b;
    xn = zeros(length(N(: ,1)) ,1);
    BN = inv(B)*N;
    z = (cB')*BN;
    costorelativo = z - cN';
    
    cr = max(costorelativo);
    cpvt = find(costorelativo == cr,1,'last');
    h = [];
    for i = 1:length(BN(:,1))
        if BN(i,cpvt) == 0 | BN(i,cpvt) < 0
            h(i) = inf;
        else
            h(i) = xb(i)/(BN(i,cpvt));
        end
    end
    fp = min(h);
    fpvt = find(h == fp,1,'last');
    Auxindex = indexN;
    indexN(cpvt) = indexB(fpvt);
    indexB(fpvt) = Auxindex(cpvt);
    B = [];
    cN = [];
    cB = [];
    for i = 1:length(indexN)
        N(:,i) = A(:,indexN(i));
        cN =[ cN;c(indexN(i))];
    end
    for i = 1:length(indexB)
        B(:,i) = A(:,indexB(i));
        cB =[cB ;c( indexB(i))];
    end
    BN = inv(B)*N;
    A = inv(B)*A;
    b = inv(B)*b;
    z = cB'*BN;
    costorelativo = z - cN';
end
Z = b'*cB;
