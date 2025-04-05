% Ítem [2] En el archivo Curvas_Medidas_RLC_2025.xls (datos en la hoja 1 y etiquetas en la hoja
% 2) están las series de datos que sirven para deducir los valores de R, L y C del circuito. Emplear
% el método de la respuesta al escalón, tomando como salida la tensión en el capacitor.

close all; clear all; clc

% En primer se importa los datos del Excel
data = xlsread('Curvas_Medidas_RLC_2025.xls'); 
t = data(1:end,1);
i = data(1:end,2);
Vc = data(1:end,3);
u = data(1:end,4);
Ei = max(u);

% Grafico los datos del Excel
figure(1);hold on;
subplot(3,1,1);plot(t,i);grid on; title('i corriente');
subplot(3,1,2);plot(t,Vc);grid on; title('Vc tension del capacitor');
subplot(3,1,3);plot(t,u);grid on; title('Ve entrada');

% figure(2); hold on;
% plot(t,Vc);grid on; title('Vc tension del capacitor')
% T1=0.01049
% G=tf(12,[T1 1])
% % step(G)
% Gr=tf('s')
% tao=.01; %Retardo de .01seg
% Ga=tf([-tao/2 1],[tao/2 1])
% step(G*Ga)








