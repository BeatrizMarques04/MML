function P = calcula_particao(linha_do_representante, x, K) % determinar a partição (P) atribuindo cada evento ao 
% representante mais próximo, com base nas dissimilaridades calculadas

    N = length(x); % Número de elementos da BD

    % Inicializa a matriz de dissimilaridades
    d = zeros(K, N);

    % Para todos os eventos, calcula a dissimilaridade entre o evento e os representantes
    for i = 1:K % para todos os eventos
        for j = 1:N % para todos os clusters
            
            % d(i,j) é a dissimilaridade do evento i ao representante j
            d(i,j) = calcula_dissemelhanca(x(linha_do_representante(i), :), x(j, :)); % calcula a dissimilaridade entre o i-ésimo 
            % representante do cluster e o j-ésimo evento da base de dados. Esta medida é usada para determinar o cluster 
            % mais próximo de cada evento e ajustar os representantes
        
        end
    end

    % Exibe a matriz de dissimilaridades
    disp('Matriz de Dissimilaridades:');
    disp(d);

    % Constrói a partição com base nas dissimilaridades
    P = constroi_particao(d, N, K); % P contém lista de índices dos representantes para cada evento da BD

end