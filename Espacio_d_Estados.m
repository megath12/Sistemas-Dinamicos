
clc
clear all

a=[-1 0 -1;-2 2 0;-1 0 -1];
b=[1 2 0]';
c=[-10 0 10];
d=0;
xi=[1,1,-1]';
u=1;
xc=1;

syms t
eat=expm(a*t)
est=eat*xi
tra=int(eat*b*u,0,t)
Res=est+tra
comp=subs(Res,t,xc);
solucion=vpa(comp,6)



