:- use_rendering(graphviz).

% Определение графа
graph(Graph) :-
    findall(edge(From, To), edge(From, To), Edges),
    gvgraph(Edges, Graph).

% Преобразование графа в формат Graphviz
gvgraph(Edges, digraph([rankdir='LR', size=5|Statements])) :-
    phrase(edges(Edges, _{id:1}, _), Statements).

% Обработка ребер графа
edges([], Options, Options) --> [].
edges([edge(From, To)|T], Options0, Options) -->
    [ From -> To ],
    edges(T, Options0, Options).

% Define the edges in the graph
edge(in, out).
edge(in, gold).
edge(in, monster).
edge(in, robber).

edge(gold, out).
edge(gold, monster).
edge(gold, robber).

edge(monster, out).
edge(monster, gold).
edge(monster, robber).

edge(robber, out).
edge(robber, gold).
edge(robber, monster).

% Определите предикат поиска в глубину
dfs(Node, Node, _, [Node]). % Базовый вариант: при достижении конечного узла
dfs(Start, End, Visited, [Start|Path]) :-
    edge(Start, Next),
    \+ member(Next, Visited),% Убедитесь, что мы не посещали этот узел до
    dfs(Next, End, [Next|Visited], Path).  %Рекурсивно выполните поиск следующего узла

%Найдите путь от "in" до "out", содержащий "gold"
% dfs(in, out, [], Path), member(gold, Path).
% Найдите путь от "входа" до "выхода", исключая "грабителя" и "монстра"
% dfs(in, out, [], Path), \+ member(robber, Path), \+ member(monster, Path).
% Граф
% graph(Graph).