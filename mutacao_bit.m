function out=mutacao_bit(matilha,tax_mut)
[m,n]=size(matilha);
bits=n-3;
for k=1:m
if(rand<tax_mut) %se a taxa de mutação for satisfeita
mut=round((bits-1).*rand+1);
matilha(k,mut)=~matilha(k,mut); %um dos bits serão modificados
out=matilha;
else out=matilha;
end
end