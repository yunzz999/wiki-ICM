close all;
clear;
clc;


%% Cargar Imagen
x_real = imread('bird.tif');
x_real = double(x_real); % 
x_real = x_real./(max(x_real(:))); % normalizar

%% Parametros

sigma = 1e-3;
lambda = 1e-1;

%% Criterio de parada
iter_max = 100; 
tol = 1e-12;


%% Imagen con ruid
x_noisy = imnoise(x_real,'gaussian',0,sigma);



%% Operadors
rho = 1e-1;
wav=@(x) wavelet('2D haar',3,x); % W
iwav=@(x) wavelet('2D haar',-3,x); % W^T



prox_f =@(x,gamma) (x + gamma*x_noisy) ./ (1 + gamma); % prox opeartor de \|x-x_noisy\|^2/2


H_rho = @(x) lambda*(sum(sum( (abs(x)-rho/2).*(abs(x)>rho)+(abs(x).^2)/(2*rho).*(abs(x)<=rho)))); %Funcion H
grad_H_rho =@(x) ((abs(x)>rho & (x)>0)-(abs(x)>rho & (x)<0)+(x./rho).*(abs(x)<=rho)); %Gradiente funcion H
grad_g = @(x) lambda*iwav(grad_H_rho(wav(x))); % gradiente de \lambda (H \circ W)

fo =@ (x) norm(x-x_noisy,2)^2/2+H_rho(wav(x));

%% Gradiente Proximal (GP1)

% Constante de Lipchitz del gradiente.
beta = rho/lambda;

gamma = 0.99*2*beta; %paso del método.

errorGP1 = 1;
r = 0;
x=x_noisy ;

tic
while errorGP1 > tol && r < iter_max
        r=r+1;
        x_o=x;
        
        x = prox_f(x-gamma*grad_g(x),gamma);

        errorGP1 = norm(x-x_o,2)/norm(x_o,2);

end

tiempo_GP1 = toc;
iter_GP1 = r;
x_GP1 = x;
fo_GP1 = fo(x_GP1)
psnr_GP1 = psnr(x_real,x_GP1);


figure;
subplot(1,3,1); imshow(x_real); title('Original'); axis image off;
subplot(1,3,2); imshow(x_noisy); title('Ruido'); axis image off;
subplot(1,3,3); imshow(x_GP1); title('Restaurada'); axis image off;
