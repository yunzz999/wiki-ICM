clear; close all; clc;
%%% 
% T. L.
[X,Y] = meshgrid(-10:.1:10); % vector parte real (sigma) e imaginaria (omega)
S=X+j*Y; % s = sigma + j*omega
Z= abs(1./(S+2)); % h(s) = 1/(s+2)
figure
mesh(X,Y,Z) % 3d Laplace
xlabel('Re')
ylabel('Im')
zlabel('|h(s)|')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T. F.
Fs = 1000; % frec. muestreo
t = 0:1/Fs:10; % vector de tiempo
X=exp(-2*t); % h(t) = e^(-2t) => h(s) = 1/(s+2)
L = length(X); % largo X
figure
n = 2^nextpow2(L); % siguiente potencia de 2 de L
Y = fft(X,n); % fft de X
f = Fs*(0:(n/2))/n; % vector de frecuencias > 0
P = abs(Y/n).^2; % fft para frec >0
plot(f,P(1:n/2+1)) % fft
xlabel("f (Hz)")
ylabel("|P(f)|^2")
axis([0 10 0 1e-3])

%%%%
% Diagrama de Bode (amplitud) como loglog(abs(F. T.))
% figure
% loglog(f,P(1:n/2+1));

%%%
% D. de B. exacto:
% amplitud [dB]: 20log(|h(w)|)
% fase [°]: atan(Im(h(w))/Re(h(w)))

s = tf('s');
h = tf(1/(s+2));
figure
bode(h)