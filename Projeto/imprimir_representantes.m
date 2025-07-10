function i = imprimir_representantes(elemento, x) % esta função exibe gráficos 5x5 de cada representante

    for i = 1:length(elemento)

        % Criar uma nova figura para cada linha
        figure;
        
        % Reshape da linha atual para formar uma matriz 5x5
        matriz_5x5 = reshape(x(elemento(i), :), 5, 5);
        matriz_5x5 = imrotate(matriz_5x5, 90);
        
        % Exibir a matriz usando a função imagesc
        imagesc(matriz_5x5);
        
        % Adicionar rótulos e título
        xlabel('Coluna');
        ylabel('Linha');
        title(['Representante Linha ' num2str(i)]);
        x(elemento(i), :)
        
        % Adicionar barra de cores
        colorbar;
    end
end