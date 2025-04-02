% Ejercicio 1: Planificador de gastos
% Definición de costos por tipo de alojamiento
costo(hotel, 1000).
costo(hostal, 500).
costo(camping, 200).

% Regla para calcular el costo total del viaje
gasto_total(Lugar, Alojamiento, Dias, Total) :-
    costo(Alojamiento, CostoDiario),
    Total is CostoDiario * Dias.


% Ejercicio 2: Horóscopo
% Definición de días válidos para cada mes
mes(enero, 31).
mes(febrero, 28).
mes(marzo, 31).
mes(abril, 30).
mes(mayo, 31).
mes(junio, 30).
mes(julio, 31).
mes(agosto, 31).
mes(septiembre, 30).
mes(octubre, 31).
mes(noviembre, 30).
mes(diciembre, 31).

% Signos del zodiaco
signo(aries, marzo, 21, abril, 19).
signo(tauro, abril, 20, mayo, 20).
signo(geminis, mayo, 21, junio, 20).
signo(cancer, junio, 21, julio, 22).
signo(leo, julio, 23, agosto, 22).
signo(virgo, agosto, 23, septiembre, 22).
signo(libra, septiembre, 23, octubre, 22).
signo(escorpio, octubre, 23, noviembre, 21).
signo(sagitario, noviembre, 22, diciembre, 21).
signo(capricornio, diciembre, 22, enero, 19).
signo(acuario, enero, 20, febrero, 18).
signo(piscis, febrero, 19, marzo, 20).

% Regla para obtener el signo zodiacal
obtener_signo(Dia, Mes, Signo) :-
    signo(Signo, MesInicio, DiaInicio, MesFin, DiaFin),
    ((Mes = MesInicio, Dia >= DiaInicio); (Mes = MesFin, Dia =< DiaFin)).


% Ejercicio 3: Diagnóstico de enfermedades
% Hechos de síntomas
tiene(pedro, fiebre).
tiene(pedro, tos).
tiene(maria, dolor_cabeza).
tiene(maria, fiebre).

diagnostico(Paciente, gripe) :-
    tiene(Paciente, fiebre),
    tiene(Paciente, tos).

diagnostico(Paciente, migraña) :-
    tiene(Paciente, dolor_cabeza),
    tiene(Paciente, fiebre).

% Consultas de ejemplo:
% ?- gasto_total(paris, hotel, 5, Costo).
% ?- obtener_signo(15, abril, Signo).
% ?- diagnostico(pedro, Enfermedad).