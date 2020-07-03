function [J, Aut]=Meio_ambiente_matrix(K1_i, K4_i)
%% vetor de tempo
t_min=0; inc=0.05; t_max=2;
t=t_min:inc:t_max;

A=[1 0.05; 0 1];
B=[0.0126 0.5048]';
C=[1 0]; T=0.05;

x=[0 0]'; n=5; % Condi��o inicial
theta1=ones(1,size(t,2));

for k=1:1:size(t,2);  
    u(:,k)=K1_i*(theta1(1,k)-x(1,k))-n*K4_i*x(2,k);
    x(:,k+1)=A*x(:,k)+B*u(1,k);
    y(:,k)=C*x(:,k);
    theta0(1,k)=x(1,k);
end

K=[K1_i, n*K4_i]; Aut=eig(A-B*K);

soma=0;
for k=1:1:size(t,2);
    soma=soma+((theta1(1,k)-theta0(1,k))^(2))*T;
end
J=100/soma;