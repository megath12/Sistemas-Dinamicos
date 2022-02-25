clc
close all
clear all

M=3;m=.5;g=9.81;l=.6;
A=[0 1 0 0; (g*(M+m))/(M*l) 0 0 0;0 0 0 1;-g*(m/M) 0 0 0];
B=[0;(-1)/(m*l);0;1/M];
C=[1 0 0 0;0 0 1 0];
D=0;
sys=ss(A,B,C,D);
step(sys,'c',3);
grid on
title('Sistema PIC');

Cn=ctrb(A,B)
if length(Cn)==rank(Cn)
    disp('El sistema es controlable')
else
    disp('El sistema no es controlable')
end

Ob=obsv(A,C);
%length(Ob)
size(Ob);
rank(Ob);

pc=[-1 -1.5 -2 -2.5];
k=place(A,B,pc);
Ac=A-B*k;
sys=ss(Ac,B,C,D)
%hold on
figure
step(sys,'r')
grid on
title('Sistema PIC con retroalimentacion')
%t=tf(sys)
%t(1);t(2);
%bode(t)


% pc=[-1 -1.5 -2 -2.5];
% L=place(A',C',pc)
% %L=L'
% Ao=(A'-(C'*L'))
% 




