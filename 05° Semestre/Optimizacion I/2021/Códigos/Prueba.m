clear all;close all;clc;
A = [1 3 2;-1 1 2;-1 3 0]; % Parte izquierda de las restricciones A = (B|N)
b = [12; 6; 9]; % restricciones
c = [-2;3;-1]; % vector cost
I = eye(length(A(:,1))); %Matrzi de holgura
A = [A I]; % Matriz con variables de holgura
c = [c;zeros(length(A(:,1)),1)];% vector costo actualizado
index = 1:length(c);
indexN = index(1:(length(A(:,1))-1));
indexB = index((length(A(:,1))+1):end);
B = [];
N = [];
cN = [];
cB = [];
for i=1: length ( indexN )
    N = [N A(:, indexN(i))];
    cN =[ cN;c(indexN(i))];
 end
 for i=1: length ( indexB )
     B =[B A(:, indexB(i))];
     cB =[cB ;c( indexB(i))];
 end
xb=B\b;
xn = zeros(length(N(: ,1)) ,1);
BN = inv(B)*N;
z = (cB')*BN;
costorelativo = z - cN'; 

xb=B\b;
xn = zeros(length(N(: ,1)) ,1);
BN = inv(B)*N;
z = (cB')*BN;
costorelativo = z - cN';
%###########################################################################
f = [];
p = [];
posicioncol = 0;
for i = 1:length(costorelativo)
    if costorelativo(i) >= 0
        f(i) = costorelativo(i);
    else
        f(i) = 0;
    end
end
maxc = max(f);                             %P1
for j = 1:length(costorelativo)
    if f(j) == maxc
        f(j) = maxc;
    else
        f(j) = 0;
    end
end
p = f;
posicioncol = find(f,1);% columna del pivote
%###########################################################################
h = [];
H = A(:,posicioncol);
for i = 1:length(b)
    if H(i) < 0
        h(i) = inf;
    else
        h(i) = b(i)/H(i);      %P2
    end
    pvt = min(h);
end
fpvt = find(h == pvt); %fila del pivote
cB(fpvt) = (-1)*c(posicioncol);
%##########################################################################
b(fpvt) = (1/A(fpvt,posicioncol))*b(fpvt);
A(fpvt,:) = (1/A(fpvt,posicioncol))*A(fpvt,:);
for k = 1:(fpvt-1)
    b(k) = b(k) - A(k,posicioncol)*b(fpvt);
    A(k,:) = A(k,:) - A(k,posicioncol)*A(fpvt,:);
end
for l = (fpvt+1):length(A(:,1))
    b(l) = b(l) - A(l,posicioncol)*b(fpvt);
    A(l,:) = A(l,:) - A(l,posicioncol).*A(fpvt,:);
end
BN = A(1:length(indexB),1:length(indexN));
B = A(1:(length(A(:,1))),(length(indexB)):(length(A(1,:))));
z = (cB')*BN;
costorelativo = z - cN';
Z = (-1)*cB'*b;