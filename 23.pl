max(X, Y, X) :- integer(X), integer(Y), X > Y.
max(X, Y, Y) :- integer(X), integer(Y), X < Y.