clear all
clc

% OBJETIVO: Processar uma base de dados 'BD1.txt' para agrupar eventos em
% clusters, bem como determinar representantes iniciais, calcular
% partições e ajustar os representantes

% Passo 1: Ler os dados do arquivo
data = fopen('BD1.txt','r'); % o ficheiro deve estar na mesma pasta
I = 25; % cada linha tem 25 valores, onde cada uma representa um valor armazenado na matriz x

% Passo 2: Definir o número de clusters (k = 3)
K = 3;

% Criar os K representantes aleatórios
i = 0;

while ~feof(data)
    i = i + 1;
    xx = fscanf(data, '%f\n', I); % ler as linhas da BD (f\n:ler um float que é seguido por uma nova linha)
    for j = 1:I
        x(i, j) = xx(j); % x(i,j) é coordenada j do evento 
    end
end

fclose(data);
N = i

% Escolher os 3 representantes iniciais
antigos_representantes = [1, 12, 23]; % escolher, aleatoriamente, 3 eventos como representantes iniciais

% Exibir os números gerados 
CP = 1;
it = 0;

while  CP > 0.0001 && it < 10
 P = calcula_particao(antigos_representantes, x, K);  
 % calcular uma partição usando os representantes anteriores através da
 % dissimilaridade de cada evento em relação aos representantes

 novos_representantes = calcula_representantes(P, x, N, K);  
 % calcular novos representantes com base nos eventos atribuídos a cada 
 % cluster, minimizando o custo da dissimilaridade

 CP = diferenca_representantes(antigos_representantes, novos_representantes); 
 % medida da diferença entre os novos representantes e os antigos, 
 % verificando se o algoritmo convergiu
 
 antigos_representantes = novos_representantes;
 it = it + 1;
end

save('principal.mat', 'novos_representantes', 'x'); % guardar os 
% representantes finais e os dados num arquivo para uso posterior
