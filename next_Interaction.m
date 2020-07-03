function [matilha, feval_melhor ,feval_pior , kma , kmin , melhor ,pior , pior2]=next_Interaction(matilha, K1min,
  K1max , K4min , K4max)
matilha2 = [0];
K1_i= matilha(:,17);
K4_i = matilha(:,18);
K1= matilha(:,1:8);
K4= matilha(:,9:16);



% Evita que indivíduos fora dos limites predeterminados no início do código
for j=1:1:10
  
if K1_i(j)>=K1max, K1_i(j)=K1max; end
if K1_i(j)<=K1min, K1_i(j)=K1min; end
end

for j=1:1:10  
if K4_i(j)>=K4max, K4_i(j)=K4max; end
if K4_i(j)<=K4min, K4_i(j)=K4min; end

end


for j=1:1:10
    [J(j,:) A(j,:)]=Meio_ambiente_matrix(K1_i(j,:), K4_i(j,:));    
end

feval_n = J;

matilha = [K1 K4 K1_i K4_i feval_n];


n_melhor=find(matilha(:,end)==max(matilha(:,end)));

n_pior=find(matilha(:,end)==min(matilha(:,end)));




feval = matilha(n_melhor(1),:);
melhor = matilha(n_melhor(1),:);
pior = matilha(n_pior(1),:);

matilha2 = [];
for b=1:1:10
  
  if pior(:,end) < matilha(b,end)
   matilha2 = [matilha2 ; matilha(b,:)];
end
end 

n_pior2=find(matilha2(:,end)==min(matilha2(:,end)));
pior2=matilha2(n_pior2(1),:);

feval_melhor = max(matilha(:,end)); % Melhor Fitness
feval_pior = min(matilha(:,end));
kma= melhor(1,end-2);
kmin= pior(1,end-1);
%kma = feval_melhor(matilha(:,1 ,feval_melhor));
%n_melhor=find(matilha(:,end)==feval_melhor); % Melhor Fitness
%melhor=matilha(n_melhor(1),:); % Melhor indivíduo