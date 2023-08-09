parent(kim,holly).
parent(margaret,kim).
parent(margaret,kent).
parent(esther,margaret).
parent(herbert,margaret).
parent(herbert,jean).
parent(jean, tonho).

% assistance predicates
grandparent(X, Y) :- parent(X, W), parent(W, Y).
brothers(X, Y) :- parent(W, X), parent(W, Y), X \= Y.
greatgrandparent(GGP,GGC) :-
	parent(GGP,GP),  parent(GP,P), parent(P,GGC).


% homework predicates
mother(X, Y) :- parent(X, Y), member(X, [margaret, esther]). %1
father(X, Y) :- parent(X, Y), member(X, [herbert, kim]). %2
sister(X, Y) :- parent(W, X), parent(W, Y), %3 
    member(X, [margaret, holly, esther]), X \= Y.
grandson(X, Y) :- parent(Y, W), parent(W, X). %4
firstCousin(X, Y) :- grandparent(W, X), grandparent(W, Y), %5
	X \= Y, \+ brothers(X, Y).
descendant(X, Y) :- parent(Y, X).%6
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).
third([_|[_|[H2|_]]], Y) :- Y = H2. %7
firstPair([H1|[H2|_]]) :- H1 = H2. %8
del3h([_|X], X). %9
del3([X1,X2|Xs], [X1,X2|Ys]) :-
    del3h(Xs, Ys).
dupList([], []). %10
dupList([X,X|Y], [X|Z]) :-
    dupList(Y, Z).
isDuped([]). %11
isDuped([H,H|T]):-
    isDuped(T).
oddSize([]):- false. %12
oddSize([_]):- true.
oddSize([_,_]):- false.
oddSize([_,_|T]):- oddSize(T).
evenSize([]):- true. %13
evenSize([_]):- false.
evenSize([_,_]):- true.
evenSize([_,_|T]):- evenSize(T).
prefix([],[]). %14
prefix([], [_|_]).
prefix([X|T0], [X|T1]):- prefix(T0, T1).
isMama(X, [X|_]). %15
isMama(X, [_|T]):- isMama(X, T).
isSubset([], [_|_]). %16
isSubset([H|T], [Z|S]):-
    isMama(H, [Z|S]), isSubset(T, [Z|S]).
union([X0|T0], [X1|T1], [Z|S]):-
    isSubset([X0|T0], [Z|S]),
    isSubset([X1|T1], [Z|S]).
isIntersection([X0|T0], [X1|T1], [Z|S]):- %17
    isSubset([Z|S], [X0|T0]),
    isSubset([Z|S], [X1|T1]).
isEqual([X0|T0], [X1|T1]):- %18
    isSubset([X0|T0], [X1|T1]),
    isSubset([X1|T1], [X0|T0]).
powerset(_, []). %19
powerset([X|T], [X|Comb])
  :- powerset(T, Comb).
powerset([_|T], Comb)
  :- powerset(T, Comb).
isNotSubset([], [_|_]). %20
isNotSubset([H|T], [Z|S]):-
    \+ isMama(H, [Z|S]), isNotSubset(T, [Z|S]).
isDifference([X0|T0], [X1|T1], [Z|S]):-
    isSubset([Z|S], [X0|T0]),
    isNotSubset([Z|S], [X1|T1]).