clear all
clc

% Carregar as matrizes guardadas no principal.m
load('principal.mat')

% Teste
I = 25; % Número de características por evento
i = 1;
teste2 = fopen('teste2.txt', 'r'); % Ler o ficheiro de teste que contém linhas com 26 números

while ~feof(teste2)
    yk = fscanf(teste2, '%f\n', (I + 1)); % Ler as linhas da BD
    
    % Leitura da 25ª posição em xx e da 26ª posição em y
    yy = yk(1:25);
    yyy = yk(26);
    for j = 1:I
        y(i, j) = yy(j);
    end
    v(1,i) = yyy(1);
    i = i + 1;
end

fclose(teste2);


for i = 1:length(y)
    d1 = calcula_dissemelhanca(x(novos_representantes(1), :), y(i, :));
    d2 = calcula_dissemelhanca(x(novos_representantes(2), :), y(i, :));
    d3 = calcula_dissemelhanca(x(novos_representantes(3), :), y(i, :));
    % Calcular a dissimilaridade com cada um dos três representantes

    d = [d1 d2 d3]; 

    [mn, id] = min(d);
    Q(i) = id(1); % Escolher o representante com menor dissimilaridade 
    % e atribuir o índice do cluster correspondente em Q
end


% Loop para exibir gráficos para cada representante
imprimir_representantes(novos_representantes, x);

for i = 1:60 % Este ciclo exibe matrizes 5x5 rodadas para cada evento
    % Criar uma nova figura para cada linha
    figure;
    
    % Reshape da linha atual para formar uma matriz 5x5
    matriz_5x5 = reshape(y(i, :), 5, 5);
    
    % Rodar a matriz em 90 graus para a direita - a rotação  melhora a visão
    matriz_rodada = imrotate(matriz_5x5, 90);
    
    % Exibir a matriz usando a função imagesc
    imagesc(matriz_rodada);
    
    % Adicionar rótulos e título
    xlabel('Linha');
    ylabel('Coluna');  % Inversão dos rótulos para refletir a rotação
    title(['Linha ' num2str(i)]);
    
    % Adicionar barra de cores 
    colorbar;
end

% Exibir a matriz de confusão
confMat = confusionchart(v, Q); % confusionchart para as classificações 
% reais com as previstas (Q)

% Calcular a precisão
accuracy = sum(diag(confMat.NormalizedValues)) / sum(confMat.NormalizedValues(:)); 
% Calcula a precisão usando a diagonal normalizada da matriz confusão

% Adicionar a precisão do modelo ao título
title(['Matriz de Confusão (Precisão: ' num2str(accuracy*100) '%)']);

Q