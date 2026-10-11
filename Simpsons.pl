% Facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent( jackie, marge).
parent( clancy, patty).
parent( jackie, patty).
parent(clancy, selma).
parent( jackie, selma).
parent(homer, bart).
parent( marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).

% Rules
father(X,Y) :-
    parent(X,Y),
    male(X).
mother(X,Y) :-
    parent(X,Y),
    female(X).
son(X,Y) :-
    parent(Y,X),
    male(X).
daughter(X,Y) :-
    parent(Y,X),
    female(X).
sibling(X,Y) :-
    parent( P,X), parent(P,Y),
    X\=Y.
brother(X,Y) :-
    sibling(X,Y),
    male(X).
sister(X,Y) :-
    sibling(X,Y),
    female(X).
grandfather(X,Y) :-
    parent(X,Z), parent(Z,Y),
    male(X).
aunt(X,Y) :-
    parent(P,Y),
    sister(X,P).
uncle(X,Y) :-
    parent(P,Y),
    brother(X,P).
cousin(X,Y) :-
    parent(P1,X), parent(P2,Y),
    sibling(P1,P2).
ancestor(X,Y) :-
    parent(X,Y).
ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).

% Test Quiries:
%
% 1- Father:
% 10 ?- father(homer,bart). true.
%  12 ?- father(X,marge).X = clancy .
%
% 2- Mother:
%  13 ?- mother(marge,lisa). true.
%  14 ?- mother(X,ling).  X = selma.
%
% 3- Son:
% 10 ?- son(bart, homer).
true.
% 11 ?- son(X, marge).
X = bart .
%
% 4- Daughter:
%  12 ?- daughter(lisa,marge).
 true.
%  13 ?- daughter(X,homer).
X = lisa ; X = maggie.
%
%  5- Brother:
% 14 ?- brother(herb,homer).
true .
% 15 ?- brother(bart, X).
X = lisa ; X = maggie .
%
% 6- Sister:
% 16 ?- sister(lisa,bart).
true .
% 17 ?- sister(X,marge).
X = patty ; X = selma .
%
% 7- Grandfather:
% 18 ?- grandfather(abraham,bart).
 true.
% 19 ?- grandfather(X,ling).
 X = clancy .
%
% 8- Aunt:
% 20 ?- aunt(patty,bart).
 true .
% 21 ?- aunt(X,ling).
 X = marge ;
%
% 9- Uncle:
% 22 ?- uncle(herb,lisa).
 true .
% 23 ?- uncle(X,maggie).
 X = herb .
%
% 10- Cousin:
%  24 ?- cousin(bart, ling).
 true .
%  25 ?- cousin(ling, X).
 X = bart ; X = lisa ; X = maggie .
%
% 11- Ancestor:
% 26 ?- ancestor(abraham,bart).
 true .
% 27 ?- ancestor(X,ling).
 X = selma ; X = clancy ; X = jackie .
%

