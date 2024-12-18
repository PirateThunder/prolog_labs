%% Если исходный список пустой то существует одна перестановка пустой список
	perm([], []).
	%% 1-й элемент перестановки должен содержаться в исходном списке,
	%% при чем его надо сразу исключить  из оригинального списка, 
	%%  остальные элементы должны быть перестановкой перестановкой 
        %%     оставшегося оригинального списка
	perm(Source, [Element|Tail]) :- member_list_exclude(Element, Source, SourceExcluded), 
	             perm(SourceExcluded, Tail).

	%% Проверка того, что элемент содержится в списке, а 2-й список является списком без элемента
	%% Название предиката member_list_exclude соответствует порядку аргументов 
	%%  1-й - элемент, 2-й - список, 3-й - список без элементов
	member_list_exclude(X, [X|L], L).
	member_list_exclude(X, [Y|L], [Y|Ls]) :- member_list_exclude(X, L, Ls).

% perm([1,2,3],X)
% perm([5, 7, 11,9], X)
