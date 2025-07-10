function CP = diferenca_representantes(antigos_representantes, novos_representantes)
% Verifica a variação das coordenadas dos representantes inicias com
% os novos representantes

CP = sum(antigos_representantes ~= novos_representantes);

end