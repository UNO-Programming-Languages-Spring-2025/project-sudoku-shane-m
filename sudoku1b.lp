% Sudoku Solver
% Name: Shane May
% Hints:

% Input values 
% NOTE: This took me 2 hours just to find out I forgot inputs :(
sudoku(X, Y, N) :- initial(X, Y, N).

% Create a set of numbers (1-4)
value(1..4).
rows(1..4).
collums(1..4).

% x => row number; y => collum number; N => value
% number for every : x by y
{sudoku(X,Y,N) : value(N)} = 1 :- rows(X), collums(Y).

% No Repeated number
:- rows(X), value(N), #count {Y : sudoku(X, Y, N)} != 1.
:- collums(Y), value(N), #count {X : sudoku(X,Y,N)} != 1.

% Subgrids => {LT, RT, LB, RB}
% LT
subgrid(X,Y,1) :- rows(X), collums(Y), X <= 2, Y <= 2.
% RT
subgrid(X,Y,2) :- rows(X), collums(Y), X <= 2, Y > 2.
% LB
subgrid(X,Y,3) :- rows(X), collums(Y), X > 2, Y <= 2.
% RB
subgrid(X,Y,4) :- rows(X), collums(Y), X > 2, Y > 2.

#show sudoku/3.
#show subgrid/3.