clear all, close all, clc
P = 2; % Fijar P inicialmente
num = [1+P -P]; % Numerador
den = [1 3 6]; % Denominador
G = tf(num, den); % Función de transferencia
step(G);
figure,rlocus(G); % Lugar de raíces con ganancia negativa

T1 = 1/2; % Cero
T2 = 1/5; % Polo
alpha = T2 / T1; % Relación entre polo y cero
Kc = 1; % Ganancia inicial del compensador

C = tf(Kc * [1 1/T1], [1 1/T2]); % Compensador en adelanto

figure,rlocus(C*G); % Lugar de raíces con el compensador

% Ti = 0.5; % Constante integral
% C_PI = tf([Ti, 1], [Ti, 0]); % Controlador PI

% Sistema compensado completo
 
FLC=feedback(-1.12*C*G,1);
% Simulación y análisis
figure,step(FLC,100); % Respuesta al escalón
% figure,bode(C_PI * C * G); % Diagrama Bode

Kp=.005;Ki=1;

C2=tf(Kp*[1 Ki/Kp],[1 0]);
rlocus(-1*C*C2*G);

FLC=feedback(-1*C*C2*G,1); %bode(.3*C2*C*G)
roots(FLC.Den{1}) % rlocus(-C2*G)
figure,step(FLC,100)

