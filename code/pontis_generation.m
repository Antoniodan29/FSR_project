function obstacle = pontis_generation(obs)

    x_centro=obs(1);
    y_centro=obs(2);
    raggio=obs(3);
    z_min=obs(4);
    z_max=obs(5);
    num_punti_cerchio=10;
    num_punti_altezza=70;
    % Genera punti sulla superficie di un cilindro e li restituisce come una matrice 3xN

    % Creare vettori per gli angoli e le altezze
    theta = linspace(0, 2*pi, num_punti_cerchio);
    z = linspace(z_min, z_max, num_punti_altezza);

    % Preallocare la matrice per i punti
    obstacle = zeros(3, num_punti_altezza * num_punti_cerchio);

    % Indice per il riempimento della matrice dei punti
    idx = 1;

    % Generare i punti sulla superficie del cilindro
    for i = 1:num_punti_altezza
        for j = 1:num_punti_cerchio
            x = x_centro + raggio * cos(theta(j));
            y = y_centro + raggio * sin(theta(j));
            obstacle(:, idx) = [x; y; -z(i)];
            idx = idx + 1;
        end
    end
end



