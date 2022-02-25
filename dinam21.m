
clc
close all
clear all

M=3;m=.5;g=9.81;l=.6;
A=[0 1 0 0; (g*(M+m))/(M*l) 0 0 0;0 0 0 1;-g*(m/M) 0 0 0];
B=[0;(-1)/(m*l);0;1/M];
C=[1 0 0 0;0 0 1 0];
D=0;
%syms k1 k2 k3 k4 lambda 
% K=[k1 k2 k3 k4];
% pc=det(lambda*eye(4)-(A-B*K))
% pretty(pc)
% 
% %po=[-1 -1.5 -2 -2.5];
% po=(lambda+1)*(lambda+1.5)*(lambda+2)*(lambda+2.5)
% expand(po)


syms l1 l2 l3 l4 lambda 
L=[l1 l2 l3 l4];
pc=det(lambda*eye(4)-(A-L*C))
pretty(pc)

%po=[-1 -1.5 -2 -2.5];
po=(lambda+1)*(lambda+1.5)*(lambda+2)*(lambda+2.5)
expand(po)