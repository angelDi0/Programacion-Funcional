    % Definición de los platos
entrada(antipasto).
entrada(sopa).
entrada(quesos).

plato_principal(milanesa) :- carne(milanesa).
plato_principal(pejerrey) :- pescado(pejerrey).

carne(milanesa).
pescado(pejerrey).

postre(flan).
postre(helado).

% Relación de comida completa
comida(E,P,D) :- entrada(E), plato_principal(P), postre(D).

% Información calórica
calorias(antipasto, 200).
calorias(sopa, 150).
calorias(quesos, 300).
calorias(milanesa, 500).
calorias(pejerrey, 400).
calorias(flan, 250).
calorias(helado, 300).

% Cálculo del valor calórico total
valor(E,P,D,V) :- 
    calorias(E,X), 
    calorias(P,Y), 
    calorias(D,Z), 
    V is X + Y + Z.

% Definición de comida equilibrada 
comida_equilibrada(E,P,D) :- 
    valor(E,P,D,V), 
    V =< 800.
