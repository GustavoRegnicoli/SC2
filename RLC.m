close all; clear all; clc
syms ie ie_p Vc Vc_p Ve R L C;
% Planteo las ecuaciones diferenciales no lineales
ie_p=-(R/L)*ie-(1/L)*Vc+(1/L)*Ve;
Vc_p=(1/C)*ie;
% Aplicando Taylor en cada variable obtengo las matrices A y B
Mat_A=[[diff(ie_p, ie) diff(ie_p, Vc)];[diff(Vc_p, ie) diff(Vc_p, Vc)]];
Mat_B=[[diff(ie_p, Ve)];[diff(Vc_p, Ve)]];
disp('Matriz A')
pretty(simplify(Mat_A))
disp('Matriz B')
pretty(simplify(Mat_B))
