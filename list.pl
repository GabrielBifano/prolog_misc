myAppend([], L, L).
myAppend([Head|TailA], B, [Head|TailC])
  :- myAppend(TailA, B, TailC).

myMember(X, [X|_]).
myMember(X, [_|Y])
  :- myMember(X, Y).

mySelect(X, [X|L], L).
mySelect(X, [H|L], [H|LR])
  :- mySelect(X, L, LR).

myReverse([], []).
myReverse([H|T], X)
  :- myReverse(T, XAux), myAppend(XAux, [H], X).

powerset(_, []).
powerset([X|T], [X|Comb])
  :- powerset(T, Comb).
powerset([_|T], Comb)
  :- powerset(T, Comb).
     /*
powerset([_|T], [E|Comb])
  :- powerset(T, [E|Comb]).
  */

nperm([], []).
nperm([H|T], L) :- nperm(T, Lx), select(H, L, Lx).
