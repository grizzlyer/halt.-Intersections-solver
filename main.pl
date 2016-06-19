:- use_module(circolazione).
:- use_module(utils).
:- use_module(gestore_kb).


menu :-
%	writef('%50c', ['-------Menu-------']).
	write('---------Menu---------'), nl,
	write('[1] Inserisci incrocio'), nl,
	write('[2] Risolvi incrocio'), nl,
	write('[3] Cancella incrocio'), nl,
	write('[4] Visualizza incrocio'), nl,
	write('[5] Genera grafo di precedenze'), nl,
	write('[0] Esci'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(Scelta), nl,
	call(scelta-Scelta).


scelta-1 :-
	read(Incrocio),
	utils:payload(Incrocio, Fatti),
	inserisci_incrocio(Fatti), nl,
	menu.

scelta-2 :-
	write('--Soluzione:'), nl,
	circolano, nl,
	menu.

scelta-3 :-
	cancella_incrocio, nl,
	menu.


scelta-4 :-
	write('--WORK IN PROGRESS'), nl,
	menu.

scelta-5 :-
%	working_directory(CWD, CWD),
	utils:salva_grafo('/home/giuseppe/', 'precede'),
	menu.
	
%scelta-0 :-
%	halt.

scelta-0.

% Per il dataset già a disposizione
scelta-test :-
	write('--Inserisci l\'ID del caso da caricare :'), read(ID),
	test(ID, Incrocio),
	write('--Caso caricato!'), nl,
	write(Incrocio), nl,
	menu.

start :-
	menu.

%start :-
%	write('--Opzione non riconosciuta!'), nl, nl,
%	menu.


