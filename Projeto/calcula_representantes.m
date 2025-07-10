function novos_representantes = calcula_representantes(P, x, N, K)
% calcula novos representantes com base nos eventos atribu�dos a cada 
% cluster, minimizando o custo de dissimilaridade

novos_representantes = zeros(1, K);  % Cria um vetor para armazenar o �ndice de cada novo representante dos clusters. 
% Inicialmente, todos os valores s�o zero

for i = 1:K
    % Encontrar os �ndices dos eventos pertencentes � classe i (ou seja, aqueles que foram atribu�dos a este cluster na parti��o P)
    indices_classe = find(P == i);
    
    custos = zeros(1, length(indices_classe));  % Cria um vetor para armazenar os custos de 
    % dissimilaridade para cada evento no cluster i
    
    % Calcula o custo para cada elemento ser representante da classe i
    for j = 1:length(indices_classe)
        custos(j) = calcula_custo(x(indices_classe(j), :), x(indices_classe, :));
    end
    
    % Encontra o elemento com o menor custo
    [ord, indice_menor_custo] = min(custos);
    
    % Armazena o �ndice do elemento com menor custo como novo representante
    novos_representantes(i) = indices_classe(indice_menor_custo);
    
end

end