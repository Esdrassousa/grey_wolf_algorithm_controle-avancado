function [alpha, beta, delta, omegas]=selecao(matilha)
    
[alpha matilha_a]=avaliacao(matilha); % matilha_a= matilha-alpha
[beta matilha_ab]=avaliacao(matilha_a); % matilha_ab= matilha-alpha-beta
[delta matilha_abd]=avaliacao(matilha_ab); % matilha_abd= matilha-alpha-beta-delta

omegas = [];


for j=1:1:7
  %if matilha_abd(j,1)~=0
  
omegas=[omegas; matilha_abd(j,:)];
%end
end


%[matilha(:,1:16) , alpha , beta , omegas]