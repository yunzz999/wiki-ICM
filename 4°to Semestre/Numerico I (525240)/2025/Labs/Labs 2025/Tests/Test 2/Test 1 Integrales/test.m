% Variables a evaluar
% nodo_37
% y2_PM
% error2_PM
% M
% y2_T
% error2_T
% es_nodo
N=50;
%Funciones
aprox1= @(t) exp(t);
aprox2 = @(s) exp((2-s)).*(-exp(s).*sin(s));
sol = @(t) exp(t)*cos(t);


xx=linspace(0,2,51);
nodo_37=xx(38); 


y2_PM=aprox1(2)+punto_medio(0,2,aprox2,N+1);
error2_PM=abs(sol(2)-y2_PM);

k=sol(2);
M_s=-1;
for i=1:1000
    y=aprox1(2)+simpson(0,2,aprox2,i);
    e=abs(k-y);
    if(e<1e-6)
        M_s=i+1;
        break;
    end
end

%Trapecios
M=80;
tt=linspace(0,2,M+1); % +1 por los intervalos
y2_T=aprox1(2)+trapecio(0,2,aprox2,M+1);
error2_T=abs(sol(2)-y2_T);

%sobre si es nodo
es_nodo=0;
if ismember(1.7750,tt)
    es_nodo=1;
end




