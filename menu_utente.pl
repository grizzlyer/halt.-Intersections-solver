:- module(menu_utente, [menu_utente/0]).

:- use_module(circolazione).
:- use_module(utils).
:- use_module(precedenze).
:- use_module(gestore_kb).

menu_utente :-
%	writef('%50c', ['-------Menu-------']).
	pulisci,
	write('---------Menu---------'), nl,
	write('[1] Inserisci e risolvi incrocio.'), nl,
	write('[2] Carica e risolvi un incrocio preesistente.'), nl,
	write('[3] Visualizza un incrocio.'), nl,
	write('[4] Genera grafo di precedenze di un incrocio.'), nl,
	write('[0] Esci.'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(S), nl,
	atom_concat('scelta_', S, Scelta),
	call(Scelta).


scelta_1 :-
	write('--Inserisci i fatti separati da "," e circondati da parentesi quadre:'), nl,
	read(Incrocio),
	carica_in_memoria(Incrocio), nl,
	stampa_incrocio(Incrocio),
	risolvi,
	pausa,
	menu_utente.

% Per il dataset già a disposizione
scelta_2 :-
	write('--Inserisci l\'ID del caso da caricare: '), read(ID),
	recupera_incrocio(ID, Incrocio),
	write('--Caso caricato!'), nl,
	stampa_incrocio(Incrocio),
	risolvi,
	pausa,
	menu_utente.

scelta_3 :-
	write('--Inserisci l\'ID del caso da caricare: '), read(ID),
	recupera_incrocio(ID, Incrocio),
	stampa_incrocio(Incrocio),
	pausa,
	menu_utente.

scelta_4 :-
%	working_directory(CWD, CWD),
	write('--Inserisci l\'ID del caso da caricare: '), read(ID),
	recupera_incrocio(ID, Incrocio),
	utils:visualizza_grafo,
	menu_utente.
	
%scelta-0 :-
%	halt.

scelta_0.

% Mette in pausa per consentire all'utente di visualizzare i risultati
pausa :-
	write('--Premi Invio per continuare...'), get_char(_), get_code(_), nl.


risolvi :-
	write('--Soluzione:'), nl,
	circolano, nl.
