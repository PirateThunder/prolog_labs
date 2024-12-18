sort_tree([], nil).
	sort_tree([X|L], Tree) :- sort_tree(L, LTree), plus(X, LTree, Tree).

	%% Добавление в элемента в дерево
	plus(X, nil, tree(X, nil, nil)).
	plus(X, tree(O, L, R), tree(O, ResL, R)) :- O >= X, plus(X, L, ResL).
	plus(X, tree(O, L, R), tree(O, L, ResR)) :- O < X, plus(X, R, ResR).

	sort_t(X, Y) :- sort_tree(X, Tree), tree_list(Tree, Y).

	append_list([], L, L).
	append_list([X|L], R, [X|T]) :- append_list(L, R, T).

	tree_list(nil, []).
	tree_list(tree(X, L, R), List) :- tree_list(L, ListL), tree_list(R, ListR),
	    append_list(ListL, [X|ListR], List).

% sort([-3, 1, 4, 1, 11,-10,5], Sorted).
