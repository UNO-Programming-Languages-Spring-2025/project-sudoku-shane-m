% Sudoku Solver
% Name: Shane May
% Hints:

% Input values 
% NOTE: This took me 2 hours just to find out I forgot inputs :(
sudoku(X, Y, N) :- initial(X, Y, N).

% Create a set of numbers (1-9)
value(1..9).
rows(1..9).
collums(1..9).

% x => row number; y => collum number; N => value
% number for every : x by y
{sudoku(X,Y,N) : value(N)} = 1 :- rows(X), collums(Y).

% No Repeated number
:- rows(X), value(N), #count {Y : sudoku(X, Y, N)} != 1.
:- collums(Y), value(N), #count {X : sudoku(X,Y,N)} != 1.

% Subgrids => {LT, RT, LB, RB}
% LT
subgrid(X,Y,1) :- rows(X), collums(Y), X <= 3, Y <= 3.
% MT
subgrid(X,Y,2) :- rows(X), collums(Y), X <= 3, 3 < Y <= 6.
% RT
subgrid(X,Y,3) :- rows(X), collums(Y), X <= 3, 6 < Y <= 9.

% LM
subgrid(X,Y,4) :- rows(X), collums(Y), 3 < X <= 6, Y <= 3.
% MM
subgrid(X,Y,5) :- rows(X), collums(Y), 3 < X <= 6, 3 < Y <= 6.
% RM
subgrid(X,Y,6) :- rows(X), collums(Y), 3 < X <= 6, 6 < Y <= 9.

% LT
subgrid(X,Y,7) :- rows(X), collums(Y), 6 < X <= 9, Y <= 3.
% MT
subgrid(X,Y,8) :- rows(X), collums(Y), 6 < X <= 9, 3 < Y <= 6.
% RT
subgrid(X,Y,9) :- rows(X), collums(Y), 6 < X <= 9, 6 < Y <= 9.

% Constrain to subgrid to check values
:- value(N), #count {X,Y: subgrid(X,Y,1), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,2), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,3), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,4), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,5), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,6), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,7), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,8), sudoku(X,Y,N)} != 1.
:- value(N), #count {X,Y: subgrid(X,Y,9), sudoku(X,Y,N)} != 1.

#show sudoku/3.
