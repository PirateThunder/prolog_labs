database
xpositive(symbol, symbol)
xnegative(symbol, symbol)
predicates
run
it_is(symbol)
drink_is(symbol)
ask(symbol, symbol)
positive(symbol, symbol)
negative(symbol, symbol)
remember(symbol, symbol, symbol)
clear_facts
goal
run.
clauses
run :-write("Отвечать д/н\n"), drink_is(X), !,
write("\n Вам подходит энергетический напиток: ", X), nl, clear_facts.
run :-write("\n Пейте воду"), clear_facts.

positive(X, Y) :- xpositive(X, Y), !.
positive(X, Y) :- not(negative(X, Y)), !, ask(X,Y).
negative(X, Y) :- xnegative(X, Y), !.

ask(X, Y) :-
write("Напиток должен ", X, " ", Y, "?\n"),
readln(Reply),
remember(X, Y, Reply).
remember(X, Y, "д") :- asserta(xpositive(X, Y)).
remember(X, Y, "н") :- asserta(xnegative(X, Y)), fail.

clear_facts :- retract(xpositive(_, _)), fail.
clear_facts :- retract(xnegative(_, _)), fail.
clear_facts :- write("\n press enter"), readchar(_).

it_is("содержать кофеин"):-positive("бодрить", "на длительное время").
it_is("без кофеина"):-not(positive("бодрить", "на длительное время")).
it_is("спортивный напиток"):-not(positive("помогать в восстановлении", "после тренировки")).
it_is("энергетик Литвина"):-positive("бодрить", "на длительное время").

drink_is("Red Bull"):-
it_is("содержать кофеин"),
positive("иметь", "характерный вкус"),
positive("стоить", "дорого"),
positive("иметь", "яркую упаковку"),!.

drink_is("Monster Energy"):-
it_is("содержать кофеин"),
positive("быть", "самым мощным напитком"),
positive("иметь", "разнообразные вкусы"),
positive("иметь", "агрессивный дизайн"),!.

drink_is("Gatorade"):-
it_is("спортивный напиток"),
positive("иметь", "витамины и минералы"),
positive("быть", "рекомендован спортсменам"),
positive("иметь", "специальные добавки"),!.

drink_is("Lit Energy"):-
it_is("энергетик Литвина"),
positive("иметь", "характерный вкус"),
positive("иметь", "разнообразные вкусы"),
positive("давать", "возможность выиграть бмв"),!.