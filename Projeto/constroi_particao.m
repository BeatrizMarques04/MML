function P = constroi_particao(d, N, K)
% d(i,j) - tem distância de evento i ao representante j; 
% N é número de eventos; 
% K é número de representantes.

% para todos os eventos e todos os representantes, vê qual é a distancia 
% mínima do evento ao representante e atribui à posição i da partição o 
% índice do representante mais próximo

  for j = 1:N
        [ord, ind] = sort([d(1, j), d(2, j), d(3, j)]);
        P(j) = ind(1);        
  end
 
end