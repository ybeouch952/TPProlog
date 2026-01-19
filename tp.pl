% =====================================================
% TP PROLOG - Younes BEOUCH
% Introduction aux faits, règles et listes
% =====================================================

% === PARTIE 1 : Faits ===
% Déclaration des couleurs des objets
couleur(pomme, rouge).
couleur(ballon, bleu).
couleur(citron, jaune).
couleur(carotte, orange).

% Ce que chaque personne mange
mange(romain, pomme).
mange(lea, citron).
mange(sarah, pomme).
mange(bob, carotte).
mange(claire, banane).

% === PARTIE 2 : Règles simples ===
% X aime Y s'il mange Y
aime(X, Y) :- mange(X, Y).

% Classification des aliments
type(pomme, fruit).
type(citron, fruit).
type(banane, fruit).
type(carotte, legume).

% Personne aime un fruit si elle en mange un
aime_fruit(Personne) :- 
    mange(Personne, Y), 
    type(Y, fruit).

% X et Y ont la même couleur
meme_couleur(X, Y) :- 
    couleur(X, C), 
    couleur(Y, C).

% A et B mangent la même chose
aiment_la_meme_chose(A, B) :- 
    mange(A, Z), 
    mange(B, Z).

% === PARTIE 3 : Listes récursives ===
% Longueur : cas vide
longueur([], 0).
% Longueur : 1 + longueur du reste
longueur([_|T], N) :- 
    longueur(T, N1), 
    N is N1 + 1.

% Somme : cas vide
somme([], 0).
% Somme : tête + somme du reste
somme([H|T], S) :- 
    somme(T, S1), 
    S is H + S1.

% === PARTIE 4 : Famille ===
% Hommes et femmes
homme(pierre). homme(luc). homme(andre).
femme(marie). femme(sara).

% Relations parent-enfant
parent(pierre, luc).
parent(marie, luc).
parent(andre, pierre).
parent(sara, marie).

% Père = homme + parent
pere(P, E) :- homme(P), parent(P, E).
% Mère = femme + parent
mere(M, E) :- femme(M), parent(M, E).
% Grand-parent = parent du parent
grand_parent(GP, E) :- parent(GP, P), parent(P, E).

% Ancêtre (récursif)
ancetre(A, E) :- parent(A, E).           % Cas direct
ancetre(A, E) :- parent(A, P), ancetre(P, E).  % Via intermédiaire

% Frère/sœur = même parent, personnes différentes
frere_ou_soeur(A, B) :- parent(P, A), parent(P, B), A \= B.

% === PARTIE 5 : Problèmes classiques ===
% Membre de liste (récursif)
membre(X, [X|_]).                       % Tête
membre(X, [_|T]) :- membre(X, T).        % Queue

% Maximum de liste
max_liste([X], X).                      % Liste singleton
max_liste([H|T], Max) :- 
    max_liste(T, M), 
    (H > M -> Max = H ; Max = M).       % Comparaison conditionnelle
