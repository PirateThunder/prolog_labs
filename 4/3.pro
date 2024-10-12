member(X, [X|_]).
	member(X, [_|L]) :- member(X, L).

	comb([], []).
	%% Вариант 1 : 1-й элемент сочетания содержится в исходном списке
	comb([X|List], [X|Tail]) :- comb(List, Tail).
	%% Вариант 2 : сочетание является правильным сочетанием хвоста списка,
	%%     то есть 1-й элемент исходного списка не содержится в сочетании
	comb([_|List], Tail) :- comb(List, Tail).