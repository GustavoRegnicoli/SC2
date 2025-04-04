% Ítem [1] Asignar valores a R=220, L=500mHy, y C=2,2uF. Obtener simulaciones que permitan
% estudiar la dinámica del sistema, con una entrada de tensión escalón de 12V, que cada 10ms
% cambia de signo.

close all; clear all; clc
% Se le asignan valores a los siguientes parámetros
R=200; L=500e-3; C=2.2e-6;
% Matriz del sistema
Mat_A=[-R/L, -1/L; 1/C 0];
% Vector de entrada
Mat_B=[1/L; 0];
% Vector de salida
Mat_C=[R 0];


% La inversa de la matriz de los valores propios
ieig=-1*(1./(eig(Mat_A)));
tR=log(0.95)/real(min(eig(Mat_A))) %Constante de tiempo más rápida
tL=log(0.05)/real(max(eig(Mat_A))) %Constante de tiempo más lerda


% [numerador, denominador] = ss2tf(Mat_A, Mat_B, Mat_C, 0);
% G = tf(numerador, denominador);
% figure
% step(G*12)

% Se define el paso h, el tiempo fina Tf y la cantidad de pasos
h=tR/3;Tf=tL*3;pasos=Tf/h;
% Parametros para la fuente
t=[];
talt=10e-3; %La fuente cambia cada 10mseg
ii=1;
% Condiciones iniciales
i(1)=0;Vc(1)=0;Ve=12;
X0=[i(1);Vc(1)];x=[0;0];
Vo(1)=0;
while(ii<(pasos+1))
    t(ii)=ii*h;
    u(ii)=Ve;
    % if(t(ii)>talt)% Cada 10ms la tension se invierte
    %     Ve=Ve*-1;
    %     talt=talt+10e-3;
    % end
    i(ii)=x(1);Vc(ii)=x(2);
    xp=Mat_A*(x-X0)+Mat_B*u(ii);
    x=x+h*xp;
    y=Mat_C*x;
    Vo(ii)=y;
    ii=ii+1;
end
% Se grafica la corriente i, la tension del capacitor Vc y la tension de
% entrada Ve
figure(1);hold on;
subplot(4,1,1);plot(t,i);grid on; title('i corriente');
subplot(4,1,2);plot(t,Vc);grid on; title('Vc tension del capacitor');
subplot(4,1,3);plot(t,u);grid on; title('Ve entrada');
subplot(4,1,4);plot(t,Vo);grid on; title('Vo salida');

