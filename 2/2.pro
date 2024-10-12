Код программы
% Динамические факты для хранения родственных отношений
:- dynamic(parent/2).

% Предикат для добавления родственного отношения
add_relation(Child, Parent) :-
    assertz(parent(Child, Parent)), % Добавление факта родительства
    format(
        'Added parent-child relationship: ~w is a parent of ~w~n',
        [Parent, Child]
    ).

% Предикат для удаления родственного отношения
remove_relation(Child, Parent) :-
    retract(parent(Child, Parent)), % Удаление факта родительства
    format(
        'Removed parent-child relationship: ~w is no longer a parent of ~w~n',
        [Parent, Child]
    ).

% Предикат для изменения родственного отношения
update_relation(Child, OldParent, NewParent) :-
    retract(parent(Child, OldParent)), % Удаление старого факта родительства
    assertz(parent(Child, NewParent)), % Добавление нового факта родительства
    format(
        'Updated parent-child relationship: ~w is no longer a parent of ~w, ~w is now a parent of ~w~n',
        [OldParent, Child, NewParent, Child]
    ).

% Предикат для сохранения родственных отношений в файл
save_family_to_file(FileName) :-
    tell(FileName), % Открываем файл для записи
    listing(parent/2), % Записываем факты parent/2
    told, % Закрываем файл
    format(
        'Family relations have been saved to file: ~w~n', 
        [FileName]
    ).
% Добавление родственных отношений
?- add_relation('Lesha', 'Dasha'). % 'Dasha' становится родителем 'Lesha'
?- add_relation('Misha', 'Lesha'). % 'Lesha' становится родителем 'Misha'
?- add_relation('Ilya', 'Lesha'). % 'Lesha' становится родителем 'Ilya'

% Удаление родственного отношения
?- remove_relation('Misha', 'Lesha'). % 'Lesha' перестает быть родителем 'Misha'

% Изменение родственного отношения
?- update_relation('Ilya', 'Lesha', 'Yura'). % Родительство меняется с 'Lesha' на 'Yura' у 'Ilya'

% Сохранение родственных отношений в новый файл
?- save_family_to_file('family.txt'). % Сохранение родственных отношений в файл 'family.txt'