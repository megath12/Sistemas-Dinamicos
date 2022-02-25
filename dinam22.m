
clc; close all; clear all

M=3;m=.5;g=9.81;l=.6;
A=[0 1 0 0; (g*(M+m))/(M*l) 0 0 0;0 0 0 1;-g*(m/M) 0 0 0];
B=[0;(-1)/(m*l);0;1/M];C=[1 0 0 0;0 0 1 0];D=0;

po=[-1 -1.5 -2 -2.5];
L=place(A',C',po)
Ao=A-L'*C
eig(A-L'*C)
sys=ss(Ao,B,C,D)
step(sys,'k')
grid on
title('Observador')

% syms l1 l2 l3 l4 l5 l6 l7 l8 lambda
% L=[l1 l2 l3 l4;l5 l6 l7 l8];
% pc=det(lambda*eye(4)-( A-L'*C)) 
% pretty(pc)
