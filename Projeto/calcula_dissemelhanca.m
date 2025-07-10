function d = calcula_dissemelhanca(x_R, x_i) % calcular diferenças elementares 
% entre dois vetores x_R e x_i, ou seja, que mede o quão "diferentes" 
% dois vetores (eventos) são
   
    d = sum(x_R ~= x_i);
    f = x_i(5) + x_i(10) + x_i(15) + x_i(20);
    s=  x_R(5) + x_R(10) + x_R(15) + x_R(20);
    if f <= s
        d = d + 2;
    end
    d = 0.04*(d - sum(x_R & x_i))
end