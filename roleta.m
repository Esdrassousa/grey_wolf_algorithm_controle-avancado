function pai=roleta(matilha)
% Somatório da função de aptidão
fitness=matilha(:,end);
[N,m]=size(matilha); 
Soma=sum(fitness);
% Seleção do indivíduo por roleta
ponteiro=rand*(Soma-(1e-3))+(1e-4); %deve pertencer )zero,Soma(
i=1; aux=matilha(1,end);
while(aux<ponteiro)
aux=aux+matilha(i,end); if i==N, i=0;end
i=i+1;
end
pai=matilha(i,:);