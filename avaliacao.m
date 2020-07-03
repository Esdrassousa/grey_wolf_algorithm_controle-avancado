function [melhor, matilha , pior]=avaliacao(matilha)
  
feval_pior=min(matilha(:,end));

%feval_media=mean(matilha(:,end));

feval_melhor=max(matilha(:,end)); 

feval_pior=min(matilha(:,end));

%n_media=find(matilha(:,end)==feval_media);

n_melhor=find(matilha(:,end)==feval_melhor); % Melhor Fitness

n_pior=find(matilha(:,end)==feval_pior); 

melhor = matilha(n_melhor(1),:); % Melhor indivíduo
pior = matilha(n_pior(1),:); % Melhor indivíduo

matilha(n_melhor(1),:) = [];