% Carregar os dados do arquivo
testData = readmatrix(['teste.txt']);  % Lê o arquivo

% Verificar o tamanho dos dados
[n_rows, n_cols] = size(testData);

% Remover a última coluna
testData = testData(:, 1:25);

% Definir as cores personalizadas:
custom_colormap = [178/255, 136/255, 192/255;  % African Violet (B288C0)
                   228/255, 183/255, 229/255]; % Pink Lavender (E4B7E5)

for i = 1:n_rows
    % Reshape da linha atual para uma matriz 5x5
    img = reshape(testData(i, :), [5, 5]);

    % Girar a imagem 90 graus no sentido horário
    img_rotated = rot90(img, 1); % -1 para sentido horário (1 para sentido anti-horário)

    % Mostrar a imagem
    figure; % Abre nova figura
    imagesc(img_rotated); % Mostra a matriz como imagem
    colormap(custom_colormap); % Aplica as cores personalizadas
    colorbar; % Exibe a barra de cores
    title(['Imagem ', num2str(i)]);
end



