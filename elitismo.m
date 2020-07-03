function [matilha,melhor , pior]=elitismo(matilha,melhor ,pior)
% Melhor e pior desta geração
n_melhor=find(matilha(:,end)==max(matilha(:,end))); %melhor individuo
n_pior=find(matilha(:,end)==min(matilha(:,end)));
%pior individuo
if matilha(n_melhor(1),end)>=melhor(end);
melhor = matilha(n_melhor(1),:);
end

if matilha(n_pior(1),end) >= pior(end);
pior=matilha(n_pior(1),:);
end


