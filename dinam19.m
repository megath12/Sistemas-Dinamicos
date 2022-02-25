clc
clear all

%p=[1 -4 -5 10];
%c=[10 10];
%[A B C D]=tf2ss(c,p)


% z=A(1,:);A(1,:)=A(2,:);
% A(2,:)=A(3,:);A(3,:)=z;
% z=B(1,1);B(1,1)=B(2,1);
% B(2,1)=B(3,1);B(3,1)=z;
% z=C(1,1);C(1,1)=C(1,3);
% C(1,3)=z;
% disp(A);disp(B);disp(C);disp(D);
% 

p=[1 -4 -5 10];
c=[0 10 10];
o=length(p);
o1=length(c);

n=zeros(3,1);
n1=eye(3);
n1(:,3)=n1(:,2);
n1(:,2)=n1(:,1);
n1(:,1)=n;

a=1;
for k=o:-1:2;
    n1(o-1,a)=-p(k);
    a=a+1;
end 
disp('A')
disp(n1)

b1=zeros(o-1,1);
b1(o-1,1)=1;
disp('B')
disp(b1)

c1=zeros(1,0-1);
g=1;
for k=o1:-1:1;
    c1(1,g)=c(k);
    g=g+1;
end 
disp('C')
disp(c1)

d=0;

disp('D')

disp(d)
sys=ss(n1,b1,c1,d);
step(sys,'b')
grid on
figure
Mob=obsv(n1,c1)
rank(Mob)

% syms a
% l=(a*eye(3)-n1);
% l1=det(l);
% l2=sym2poly(l1)
% r=roots(l2)

pc=[-1 -1.5 -2];
k=place(n1,b1,pc)
%[k v f]=place(n1,b1,pc)

w=n1-b1*k;
eig(w)
sys=ss(w,b1,c1,d);
step(sys,'g')
grid on
hold on
kr=1/dcgain(sys)
sys=ss(w,b1*kr,c1,d);
step(sys,'m')
grid on




