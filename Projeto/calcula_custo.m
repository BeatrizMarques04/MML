function custo = calcula_custo(elemento, elementos_classe) % Soma das dissimilaridades entre um elemento e 
% todos os outros elementos de sua classe
    
    % Inicializa o custo
    custo = 0;
    
    % Calcula o custo como a soma das dissimilaridades do elemento com todos os outros da classe
    for k = 1:size(elementos_classe, 1)
        custo = custo + calcula_dissemelhanca(elemento, elementos_classe(k, :));
    end
    
end