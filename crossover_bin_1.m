function filho=crossover_bin_1(pai,K1min,K1max , K4min , K4max, tax_cr)
%%
bits=length(pai)-3;
if(rand>tax_cr)
%probabilidade de match
cross=round((bits-3)*rand)+1;
% ponto de corte
% crossover
cr_filho(1,:)=[pai(1,1:cross) pai(2,cross+1:bits)];
cr_filho(2,:)=[pai(2,1:cross) pai(1,cross+1:bits)];

cr_filho_K1=cr_filho(:,1:1:8);
cr_filho_K4=cr_filho(:,9:1:16);


K1_f = K1min+(K1max-K1min)*(bin2dec(num2str(cr_filho_K1,bits/2))/((2^(bits/2))-1));
K4_f2 = K4min+(K4max-K4min)*(bin2dec(num2str(cr_filho_K4,bits/2))/((2^(bits/2))-1));

for j=1:1:2
    [J(j,:) A(j,:)] = Meio_ambiente_matrix(K1_f(j,:), K4_f2(j,:));
%         [J(j,:) A(j,:)] = Meio_ambiente(K1_f(j,:), K4_f2(j,:));

end

filho=[cr_filho_K1 cr_filho_K4 K1_f K4_f2 J];
%filho=[cr_filho x_f x_f2 feval_f];
else
filho=pai;
end