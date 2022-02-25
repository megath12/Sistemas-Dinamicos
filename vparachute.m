clc
clear all

Cd=1.42;
A=0.015;
d=1.2;
m=0.5;
g=9.81;
syms t
%syms Cd A d m g;

v=sqrt((2*g*m)/(Cd*A*d))*(1-exp(-sqrt(2*m*g*Cd*A*d)*t/m))/(1+exp(-sqrt(2*m*g*Cd*A*d)*t/m))
pretty(v)
%subs(v,f,0)
% plot(f,v,'r')
% grid


