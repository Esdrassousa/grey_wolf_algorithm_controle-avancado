close all
clear all
clc, tic

% Máximo de Interações
imax=30;


vlconv=0.5; % Velocidade de convergência 0.5

% Número de indivíduos
N=10;

r1=rand; % [0 1]
r2=rand; % [0 1]

K1min=0; K1max=15;
K4min=0; K4max=1;
bits=8;

erro=1;

%%%escolha aleatoria de 8 bits

cromossomo_K1=round(rand(N,bits));
cromossomo_K4=round(rand(N,bits));

%%%primeiros lobos da alcateia

K1_i = K1min+(K1max-K1min)*(bin2dec(num2str(cromossomo_K1,bits))/((2^bits)-1));
K4_i = K4min+(K4max-K4min)*(bin2dec(num2str(cromossomo_K4,bits))/((2^bits)-1));

for j=1:1:10
    [J(j,:) A(j,:)]=Meio_ambiente_matrix(K1_i(j,:), K4_i(j,:));    
end

matilha =[cromossomo_K1 cromossomo_K4 K1_i K4_i J];

ni = 30

n_melhor=find(matilha(:,end)==max(matilha(:,end)));

n_pior=find(matilha(:,end)==min(matilha(:,end)));

   

melhor=matilha(n_melhor(1),:);

pior=matilha(n_pior(1),:);

matilha2 = [];
for b=1:1:10
  if pior(:,end) < matilha(b,end)
   matilha2 = [matilha2 ; matilha(b,:)];
end
end 

n_pior2=find(matilha2(:,end)==min(matilha2(:,end)));
pior2=matilha2(n_pior2(1),:);


%%taxa de cruzamento
tax_cr=0.10;
%%%taxa de mutação
tax_mut=0.5;

k=1; erro=1; 
F_e = [];
%( erro > 0.1 )
##&&(erro(1,end)>0.1
while (k<=ni)&&(erro(1,end)>0.1)
  

for v=1:N 

pai(1,:)=roleta(matilha);
pai(2,:)=roleta(matilha);

filho=crossover_bin_1(pai,K1min,K1max , K4min , K4max, tax_cr);

if(filho(1,end)>=filho(2,end) && filho(1,end) >= pior(:,end))
matilha(v,:)=filho(1,:);
matilha = mutacao_bit(matilha,tax_mut);
end

if (filho(2,end) >= pior2(:,end))
matilha(v,:)=filho(2,:);
matilha = mutacao_bit(matilha,tax_mut);
end
end



[matilha,melhor,pior] = elitismo(matilha,melhor,pior);
[alpha beta delta omegas]=selecao(matilha);


a=vlconv-k*((2)/imax);

%% Inicializa

for i=1:1:size(omegas,17)

r1=rand; r2=rand;

A1=2*a*r1-a; 

C1=2*r2;

D_alpha=abs(C1*alpha(1,17)-omegas(i,17));
X1=alpha(1,17)-A1*D_alpha;

%% Operação com o beta

r1=rand; r2=rand;
A2=2*a*r1-a; % Eq(3)
C2=2*r2;

% Eq(4)

D_beta=abs(C2*beta(1,17)-omegas(i,17));
X2=beta(1,17)-A2*D_beta;
%% Operação com o delta
r1=rand; r2=rand;
A3=2*a*r1-a; % Eq(3)
C3=2*r2;
% Eq(3)
D_delta=abs(C3*delta(1,17)-omegas(i,17));
X3=delta(1,17)-A3*D_delta;
%%
X(i,17)=(X1+X2+X3)/3;
omegas(i,17) = X(i,17); % Eq (11)

end



for i=1:1:size(omegas,18)

r1=rand; r2=rand;

A1=2*a*r1-a; 

C1=2*r2;

D_alpha=abs(C1*alpha(1,18)-omegas(i,18));
X1=alpha(1,18)-A1*D_alpha;

%% Operação com o beta

r1=rand; r2=rand;
A2=2*a*r1-a; % Eq(3)
C2=2*r2;

% Eq(4)

D_beta=abs(C2*beta(1,18)-omegas(i,18));
X2=beta(1,18)-A2*D_beta;
%% Operação com o delta
r1=rand; r2=rand;
A3=2*a*r1-a; % Eq(3)
C3=2*r2;
% Eq(3)
D_delta=abs(C3*delta(1,18)-omegas(i,18));
X3=delta(1,18)-A3*D_delta;
%%
X(i,18)=(X1+X2+X3)/3;
omegas(i,18) = X(i,18); % Eq (11)

[matilha,melhor,pior] = elitismo(matilha,melhor,pior);


end

%[matilha,melhor,pior] = elitismo(matilha,melhor,pior);

matilha=[alpha; beta; delta; omegas];

%% Next_Interaction
[matilha, feval_melhor ,feval_pior ,kma , kmin , melhor ,pior , pior2]=next_Interaction(matilha, K1min,
K1max , K4min , K4max);


erro = abs(feval_melhor(end)-feval_pior(end));
F_e = [F_e feval_melhor];
%clc, [feval_melhor kmin kma feval_pior]
clc,disp('alcateia') , [matilha]
k=k+1;

end
geracoes  = k
feval_melhor 
kmin 
kma
feval_pior


%%%%Plot
figure(1);
subplot(311)
plot(F_e, 'r')