bottles(0) :- 
    write('No hay mas botellas de cerveza en la pared, no hay mas botellas de cerveza.'), nl,
    write('Ve a la tienda y compra mas, 99 botellas de cerveza en la pared.'), nl.

bottles(1) :- 
    write('1 botella de cerveza en la pared, 1 botella de cerveza.'), nl,
    write('Tomala y pasala, no hay más botellas de cerveza en la pared.'), nl, nl,
    bottles(0).

bottles(N) :- 
    N > 1, 
    write(N), write(' botellas de cerveza en la pared, '), write(N), write(' botellas de cerveza.'), nl,
    write('Toma una y pasala, '), 
    N1 is N - 1, write(N1), write(' botellas de cerveza en la pared.'), nl, nl,
    bottles(N1).

start :- bottles(99).
