sort_b([], []).
	sort_b([T|R], List) :- split(T, R, Less, Great), sort_b(Less, LessSort), sort_b(Great, GreatSort), 
	                                append(LessSort, [T|GreatSort], List).

	%% Разделяем массив на 2 массива больше и меньше
	split(_, [],[], []).
	split(T, [M|R],[M|Less], Great) :- M < T, split(T,R, Less,Great).
	split(T, [M|R],Less, [M|Great]) :- M >= T, split(T,R, Less,Great).

	%% Склеиваем 2 списка
	append([], M, M).
	append([L|Left], Right, [L|Res]) :- append(Left, Right, Res).