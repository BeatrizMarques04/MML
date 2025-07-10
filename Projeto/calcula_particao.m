function P = calcula_particao(linha_do_representante, x, K) % determinar a parti��o (P) atribuindo cada evento ao 
% representante mais pr�ximo, com base nas dissimilaridades calculadas

    N = length(x); % N�mero de elementos da BD

    % Inicializa a matriz de dissimilaridades
    d = zeros(K, N);

    % Para todos os eventos, calcula a dissimilaridade entre o evento e os representantes
    for i = 1:K % para todos os eventos
        for j = 1:N % para todos os clusters
            
            % d(i,j) � a dissimilaridade do evento i ao representante j
            d(i,j) = calcula_dissemelhanca(x(linha_do_representante(i), :), x(j, :)); % calcula a dissimilaridade entre o i-�simo 
            % representante do cluster e o j-�simo evento da base de dados. Esta medida � usada para determinar o cluster 
            % mais pr�ximo de cada evento e ajustar os representantes
        
        end
    end

    % Exibe a matriz de dissimilaridades
    disp('Matriz de Dissimilaridades:');
    disp(d);

    % Constr�i a parti��o com base nas dissimilaridades
    P = constroi_particao(d, N, K); % P cont�m lista de �ndices dos representantes para cada evento da BD

end